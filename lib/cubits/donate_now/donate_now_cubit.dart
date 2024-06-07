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
  List<RequestBloodModel> bloodRequestsListSearch = [];

  void getBloodRequests() async {
    bloodRequestsList.clear();
    try {
      emit(DonateNowLoading());
      final userData = await FirebaseFirestore.instance
          .collection(kUserCollectionName)
          .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      debugPrint("Fetched users: ${userData.docs.length}");

      bool requestsFound = false;

      for (var userDoc in userData.docs) {
        final bloodRequests = await userDoc.reference.collection(kBloodRequestCollectionName).get();
        debugPrint("Fetched blood requests for user ${userDoc.id}: ${bloodRequests.docs.length}");

        if (bloodRequests.docs.isNotEmpty) {
          for (var doc in bloodRequests.docs) {
            try {
              final request = RequestBloodModel.fromFirestore(doc);
              // Check if the request date is in the past
              if (request.date.isBefore(DateTime.now())) {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(userDoc.id)
                    .collection("BloodRequests")
                    .doc(doc.id)
                    .delete();
                debugPrint("Deleted outdated request: ${doc.id}");
                // Emit initial state if no requests found
                emit(DonateNowInitial());
              } else {
                requestsFound = true;
                bloodRequestsList.add(request);
                debugPrint("Added blood request: ${request.toJson()}");
              }
            } catch (e) {
              debugPrint("Error parsing document ${doc.id}: $e");
              emit(DonateNowFailure(e.toString()));
            }
          }
        }
      }

      if (requestsFound) {
        emit(DonateNowSuccess(bloodRequestsList));
      } else {
        emit(DonateNowInitial());
      }
    } catch (e) {
      emit(DonateNowFailure(e.toString()));
    }
  }

  void searchBloodRequests(String query) async {
    emit(DonateNowLoading());
    bloodRequestsListSearch.clear();
    try {
      final userData = await FirebaseFirestore.instance
          .collection(kUserCollectionName)
          .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      bool isRequestFound = false;

      for (var userDoc in userData.docs) {
        final bloodRequests = await userDoc.reference
            .collection(kBloodRequestCollectionName)
            .where("IsAccepted", isEqualTo: false)
            .get();

        debugPrint("Fetched blood requests for user ${userDoc.id}: ${bloodRequests.docs.length}");

        for (var doc in bloodRequests.docs) {
          final request = RequestBloodModel.fromFirestore(doc);
          if (request.bloodNeeded.toLowerCase().contains(query.toLowerCase())) {
            isRequestFound = true;
            bloodRequestsListSearch.add(request);
            debugPrint("Added blood request: ${request.toJson()}");
          }
        }
      }

      if (query.isEmpty) {
        // If the query is empty, return all requests
        emit(DonateNowSuccess(bloodRequestsList));
      } else if (isRequestFound) {
        emit(DonateNowSuccess(bloodRequestsListSearch));
      } else {
        emit(DonateNowFailure("No matching requests for this blood type"));
      }
    } catch (e) {
      emit(DonateNowFailure(e.toString()));
    }
  }
}



