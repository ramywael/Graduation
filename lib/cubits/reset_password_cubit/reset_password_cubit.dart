import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/reset_password_cubit/reset_password_states.dart';

import '../../constants/constant.dart';

class ResetPassCubit extends Cubit<ResetPassStates>{
  ResetPassCubit() : super (ResetPassInitialState());

  static ResetPassCubit get(context) => BlocProvider.of(context);

  // void printSuccess(){
  //   if (kDebugMode) {
  //     print("Success");
  //   }
  // }
  //
  // void printFailure(){
  //   if (kDebugMode) {
  //     print("Failure");
  //   }
  // }


  void resendEmail (email,context)async{
    emit(ResetPassLoading());
    try{
      hasConnection(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showScaffoldMessenger(
          context: context,
          message: "Email Link Sent to Reset your Password",
          color: kPrimaryColor
      );
      emit(ResetPassSuccess());
    }catch(error){
      debugPrint(error.toString());
      emit(ResetPassFailure("The reseting process failed"));
    }
  }

}