
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signupUser(context,String email,String password) async {

    // here we will write the logic to signup the user
    // if the user is successfully signed up then we will emit SignupcubitSuccess()
    // if the user is not successfully signed up then we will emit SignupcubitFailure()
    emit(SignUpLoading());
    try {
      hasConnection(context);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (context) => const HomePage(),)
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException  catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint(e.toString());
        emit(SignUpFailure(e.toString()));
      }
    }catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }



}
