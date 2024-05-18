import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

import '../../models/request_a_blood/request_a_blood_model.dart';
import '../../screens/thanks_registration_loading_screens/thanks_for_using_app.dart';
part 'request_blood_state.dart';

class RequestBloodCubit extends Cubit<RequestBloodState> {
  RequestBloodCubit() : super(RequestBloodInitial());

  CollectionReference bloodRequest = FirebaseFirestore.instance
      .collection(kUserCollectionName)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(kBloodRequestCollectionName);

  void addRequestBlood(
      String bloodType,
      String urgencyLevel,
      int bloodBracketCount,
      String medicalImage,
      DateTime date,
      context) async {
    emit(RequestBloodLoading());
    try {
      hasConnection(context);
      String id = await generateUniqueDocumentId();
      await bloodRequest.doc(id).set(RequestBloodModel(
            uid: FirebaseAuth.instance.currentUser!.uid,
            bloodNeeded: bloodType,
            urgencyLevel: urgencyLevel,
            brackets: bloodBracketCount,
            medicalImage: medicalImage,
            date: date,
            id: id,
          ).toJson());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ThanksForUsingApp(),
        ),
      );
      emit(RequestBloodSuccess());
      debugPrint("*********************Request Added");
    } catch (e) {
      emit(RequestBloodFailure());
      debugPrint("*****************Failed to add user: $e");
    }
  }
}

Future<String> generateUniqueDocumentId() async {
  return DateTime.now().millisecondsSinceEpoch.toString();
}
