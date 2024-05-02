import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant.dart';
part 'get_current_user_state.dart';

class GetCurrentUserCubit extends Cubit<GetCurrentUserState> {
  GetCurrentUserCubit() : super(GetCurrentUserInitial());

  void getCurrentUser() async {
     emit(GetCurrentUserLoading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final userData = await FirebaseFirestore.instance.collection(kUserCollectionName).doc(user.uid).get();
          emit(GetCurrentUserSuccess(userData));
        } else {
          emit(GetCurrentUserFailure());
        }
      } catch (e) {
        emit(GetCurrentUserFailure());
      }
  }
}
