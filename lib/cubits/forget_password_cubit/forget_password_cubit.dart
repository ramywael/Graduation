import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/forget_password_cubit/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>{
  ForgetPasswordCubit() : super (ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  var passwordController1 = TextEditingController();
  var passwordController2 = TextEditingController();

  bool isPassword1 = true;
  bool isPassword2 = true;

  var formKey = GlobalKey<FormState>();

}