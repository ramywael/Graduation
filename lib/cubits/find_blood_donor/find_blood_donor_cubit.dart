import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
part 'find_blood_donor_state.dart';

class FindBloodDonorCubit extends Cubit<FindBloodDonorState> {
  FindBloodDonorCubit() : super(FindBloodDonorInitial());

  final List<QueryDocumentSnapshot> donorList = [];

  void getDonors() async {
    emit(FindBloodDonorLoading());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(kUserCollectionName).where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid,).where("IsDonor",isEqualTo: true).orderBy("uid").get();
    try {
     if(querySnapshot.docs.isEmpty){
      emit(FindBloodDonorInitial());
     }else {
       donorList.clear();
       donorList.addAll(querySnapshot.docs);
       emit(FindBloodDonorSuccess());
     }
    } catch (e) {
      emit(FindBloodDonorFailure());
    }
  }
}
