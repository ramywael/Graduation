import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'find_blood_donor_state.dart';

class FindBloodDonorCubit extends Cubit<FindBloodDonorState> {
  FindBloodDonorCubit() : super(FindBloodDonorInitial());

  final List<QueryDocumentSnapshot> donorList = [];

  void getDonors() async {
    emit(FindBloodDonorLoading());
    try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();
      donorList.clear();
      donorList.addAll(querySnapshot.docs);
      emit(FindBloodDonorSuccess());
    } catch (e) {
      emit(FindBloodDonorFailure());
    }
  }
}
