import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({ required String emailAddress, required String password,required context}) async{
    emit(LoginLoading());
    try {
      hasConnection(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password !'));
      }
    }
  }
}
