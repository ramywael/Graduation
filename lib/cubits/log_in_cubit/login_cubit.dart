import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';

import '../../screens/home/user_home_page.dart';
import '../profile/get_current_user_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login ({ required String emailAddress, required String password,required context})
  async{
    emit(LoginLoading());

    try {
      hasConnection(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      FirebaseAuth.instance.currentUser!.emailVerified;
      if(credential.user!.emailVerified){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        BlocProvider.of<GetCurrentUserCubit>(context).getCurrentUser();
        emit(LoginSuccess());
      }else{
        showScaffoldMessenger(context: context, message: "Please verify your email", color: kPrimaryColor);
        emit(LoginFailure("Please verify your email"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint(e.toString());
        showScaffoldMessenger(context: context, message: "No User Found for that email", color: kPrimaryColor);
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        debugPrint(e.toString());
        showScaffoldMessenger(context: context, message: "Wrong Password", color: kPrimaryColor);
        emit(LoginFailure('Wrong password !'));
      }
    }
  }
}
