import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/models/users/user_model.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';
import '../../constants/constant.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  SignUpCubit() : super(SignUpInitial());

  void signupUser(context, String email, String password) async {
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
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint(e.toString());
        emit(SignUpFailure(e.toString()));
      }
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

  Future<void> addUser(UserModel user) {
    // Call the user's CollectionReference to add a new user
    return users.add(user.toJson())
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }
}
