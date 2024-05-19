import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constant.dart';
import '../../models/request_a_blood/request_a_blood_model.dart';
part 'donate_now_state.dart';

class DonateNowCubit extends Cubit<DonateNowState> {
  DonateNowCubit() : super(DonateNowInitial());
  List<RequestBloodModel> bloodRequestsList = [];
  void getBloodRequests() async {
    emit(DonateNowInitial());
    bloodRequestsList.clear();
    try {
      emit(DonateNowLoading());
      final userData =
          await FirebaseFirestore.instance.collection(kUserCollectionName).where("uid",isNotEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      debugPrint("Fetched users: ${userData.docs.length}");
      for (var userDoc in userData.docs) {
        final bloodRequests = await userDoc.reference.collection("BloodRequests").get();
        debugPrint("Fetched blood requests for user ${userDoc.id}: ${bloodRequests.docs.length}");
        if (bloodRequests.docs.isNotEmpty) {
          for (var doc in bloodRequests.docs) {
            try{
              final request = RequestBloodModel.fromFirestore(doc);
              if(request.date.isBefore(DateTime.now())){
                FirebaseFirestore.instance.collection("users").doc(userDoc.id).collection("BloodRequests").doc(doc.id).delete();
              }
              bloodRequestsList.add(request);
              debugPrint("Added blood request: ${request.toJson()}");
            }catch(e){
              debugPrint("Error parsing document ${doc.id}: $e");
            }
          }
        }
      }
      emit(DonateNowSuccess(bloodRequestsList));
    } catch (e) {
      emit(DonateNowFailure(e.toString()));
    }
  }

  void searchBloodRequests(String query) async {
    emit(DonateNowLoading());
    bloodRequestsList.clear();
    try {
      final userData = await FirebaseFirestore.instance
          .collection(kUserCollectionName)
          .get();
      debugPrint("Fetched users: ${userData.docs.length}");
      for (var userDoc in userData.docs) {
        final bloodRequests = await userDoc.reference
            .collection("BloodRequests")
            .get();
        debugPrint("Fetched blood requests for user ${userDoc.id}: ${bloodRequests.docs.length}");
        if (bloodRequests.docs.isNotEmpty) {
          for (var doc in bloodRequests.docs) {
            try {
              final request = RequestBloodModel.fromFirestore(doc);
              if (request.date.isBefore(DateTime.now())) {
                await FirebaseFirestore.instance.collection("users").doc(userDoc.id).collection("BloodRequests").doc(doc.id).delete();
              }
              if (request.bloodNeeded.toLowerCase().contains(query.toLowerCase())) {
                bloodRequestsList.add(request);
                emit(DonateNowSuccess(bloodRequestsList));
                debugPrint("Added blood request: ${request.toJson()}");
              }
              if (bloodRequestsList.isEmpty) {
                emit(DonateNowFailure("No matching blood requests found"));
              } else {
                emit(DonateNowSuccess(bloodRequestsList));
              }
            } catch (e) {
              emit(DonateNowFailure(e.toString()));
              debugPrint("Error parsing document ${doc.id}: $e");
            }
          }
        }
      }
    } catch (e) {
      emit(DonateNowFailure(e.toString()));
    }
  }
  }

//   void getPendingRequests(String bloodRequestId) async {
//   DocumentSnapshot  bloodRequests = await FirebaseFirestore.instance.collection(kBloodRequestCollectionName).doc(bloodRequestId).get();
//   QuerySnapshot donationRequest = await  FirebaseFirestore.instance.collection(kBloodRequestCollectionName).doc(bloodRequestId).collection(kDonationRequestCollectionName).where("bloodBracket", isEqualTo: bloodRequests.get("currentCounter")).get().whenComplete(() => emit(DonateNowPending(bloodRequests)));
// }
//


