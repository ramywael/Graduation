import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constant.dart';
import '../../models/select_time_request/select_time_request_model.dart';
import '../../screens/thanks_registration_loading_screens/thanks_for_saving_life.dart';

part 'select_time_request_state.dart';

// class SelectTimeRequestCubit extends Cubit<SelectTimeRequestState> {
//   SelectTimeRequestCubit() : super(SelectTimeRequestInitial());
//   int counter = 0;
//   final List<SelectTimeRequestModel> requestLength = [];
//   void addTimeRequest({
//     required int hourSlot,
//     required String bloodRequestId,
//     required int bloodBracketCount,
//     required DateTime date,
//     required String email,
//     required String phone,
//     context,
//   }) async {
//     emit(SelectTimeRequestInitial());
//
//     CollectionReference timeRequest = FirebaseFirestore.instance
//         .collection(kBloodRequestCollectionName)
//         .doc(bloodRequestId)
//         .collection(kDonationRequestCollectionName);
//
//     try {
//       emit(SelectTimeRequestLoading());
//       hasConnection(context);
//       DocumentSnapshot requestDoc  = await  FirebaseFirestore.instance
//           .collection(kBloodRequestCollectionName)
//           .doc(bloodRequestId)
//           .collection(kDonationRequestCollectionName).doc(FirebaseAuth.instance.currentUser!.uid).get();
//       debugPrint("*********************Request Doc: ${requestDoc.get("bloodBracket")}");
//
//
//       await timeRequest
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .set(SelectTimeRequestModel(
//             bloodBracketCount: counter++,
//             bloodBracket: bloodBracketCount,
//             id: FirebaseAuth.instance.currentUser!.uid,
//             hourSlot: hourSlot,
//             day: date,
//             phone: phone,
//             email: email,
//           ).toJson());
//       getRequestTime(bloodRequestId);
//       if(getRequestTime(bloodRequestId) == requestDoc.get("bloodBracket")){
//         emit(SelectTimeRequestPending());
//         debugPrint("*********************Request Pending");
//       }else{
//         debugPrint("*********************Request Added");
//         emit(SelectTimeRequestSuccess());
//       }
//
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => const ThanksForUsingApp(),
//       //   ),
//       // );
//     } catch (e) {
//       emit(SelectTimeRequestFailure(e.toString()));
//       debugPrint("*****************Failed to add user: $e");
//     }
//   }
//    getRequestTime(String bloodRequestId) async {
//     QuerySnapshot doc  =  await FirebaseFirestore.instance
//         .collection(kBloodRequestCollectionName)
//         .doc(bloodRequestId)
//         .collection(kDonationRequestCollectionName).get();
//     debugPrint("*********************Request Length: ${doc.docs.length}");
//     return doc.docs.length;
//   }
//
// }


class SelectTimeRequestCubit extends Cubit<SelectTimeRequestState> {
  SelectTimeRequestCubit() : super(SelectTimeRequestInitial());

  void addTimeRequest({
    required int hourSlot,
    required String bloodRequestId,
    required int bloodBracketCount,
    required DateTime date,
    required String email,
    required String phone,
    required String recipientId,
    required BuildContext context,
  }) async {
    if (isClosed) return; // Check if the Cubit is closed before proceeding

    emit(SelectTimeRequestLoading());

    CollectionReference timeRequest = FirebaseFirestore.instance
        .collection(kBloodRequestCollectionName)
        .doc(bloodRequestId)
        .collection(kDonationRequestCollectionName);

    try {
      hasConnection(context);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference bloodRequestDoc = FirebaseFirestore.instance
            .collection(kBloodRequestCollectionName)
            .doc(bloodRequestId);

        // Read the current document within the transaction
        DocumentSnapshot bloodRequestSnapshot = await transaction.get(bloodRequestDoc);

        int currentCounter = 0; // Declare and initialize currentCounter

        // Check if the blood request document exists
        if (!bloodRequestSnapshot.exists) {
          // Initialize the document with a current counter if it doesn't exist
          transaction.set(bloodRequestDoc, {'currentCounter': currentCounter});
        } else {
          // Read the current counter
          currentCounter = bloodRequestSnapshot.get('currentCounter') ?? 0;
        }

        // Check if the current counter is less than the bloodBracketCount
        if (currentCounter < bloodBracketCount) {
          currentCounter++;

          if(currentCounter == bloodBracketCount){
            transaction.update(bloodRequestDoc, {'currentCounter': currentCounter});

            // Add the time request to the subcollection
            transaction.set(
              timeRequest.doc(FirebaseAuth.instance.currentUser!.uid),
              SelectTimeRequestModel(
                recipientId: recipientId,
                bloodBracketCount: currentCounter,
                bloodBracket: bloodBracketCount,
                id: FirebaseAuth.instance.currentUser!.uid,
                hourSlot: hourSlot,
                day: date,
                phone: phone,
                email: email,
              ).toJson(),
            );
            FirebaseFirestore.instance.collection(kUserCollectionName).doc(recipientId).update(
                {
                  "IsSaved": true
                }
            );
            FirebaseFirestore.instance.collection(kUserCollectionName).doc(recipientId).collection(kBloodRequestCollectionName).doc(bloodRequestId).update(
                {
                  "IsAccepted": true
                }
            );


            if(DateTime.now() == date.add(const Duration(days: 183))){
              FirebaseFirestore.instance.collection(kUserCollectionName).doc(FirebaseAuth.instance.currentUser!.uid).update(
                {
                  "hasDone": false,
                  "IsDonor": false,
                }
              );
            }else {
              FirebaseFirestore.instance.collection(kUserCollectionName).doc(
                  FirebaseAuth.instance.currentUser!.uid).update(
                  {
                    "IsDonor": false,
                  }
              );
            }
            emit(SelectTimeRequestSuccess());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ThanksForSavingLife(),
              ),
            );

            debugPrint("*********************Updated");
          }else {
            // Update the bloodRequest document with the new counter
            transaction.update(
                bloodRequestDoc, {'currentCounter': currentCounter});

            // Add the time request to the subcollection
            transaction.set(
              timeRequest.doc(FirebaseAuth.instance.currentUser!.uid),
              SelectTimeRequestModel(
                recipientId: recipientId,
                bloodBracketCount: currentCounter,
                bloodBracket: bloodBracketCount,
                id: FirebaseAuth.instance.currentUser!.uid,
                hourSlot: hourSlot,
                day: date,
                phone: phone,
                email: email,
              ).toJson(),
            );
            if(DateTime.now() == date.add(const Duration(days: 183))){
              FirebaseFirestore.instance.collection(kUserCollectionName).doc(FirebaseAuth.instance.currentUser!.uid).update(
                  {
                    "hasDone": false,
                    "IsDonor": false,
                  }
              );
            }else {
              FirebaseFirestore.instance.collection(kUserCollectionName).doc(
                  FirebaseAuth.instance.currentUser!.uid).update(
                  {
                    "IsDonor": false,
                  }
              );
            }

            emit(SelectTimeRequestSuccess());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ThanksForSavingLife(),
              ),
            );
            debugPrint("*********************Request Added");
          }
        } else if (currentCounter == bloodBracketCount){
          FirebaseFirestore.instance.collection(kUserCollectionName).doc(recipientId).update(
              {
                "IsSaved": true
              }
          );
        FirebaseFirestore.instance.collection(kUserCollectionName).doc(recipientId).collection(kBloodRequestCollectionName).doc(bloodRequestId).update(
          {
            "IsAccepted": true
          }
        );
        debugPrint("*********************Updated");
        }
      });
    } catch (e) {
      if (isClosed) return; // Check if the Cubit is closed before emitting a state
      emit(SelectTimeRequestFailure(e.toString()));
      debugPrint("*****************Failed to add user: $e");
    }
  }
}