import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/reset_password.dart';
import '../../cubits/forget_password_cubit/forget_password_cubit.dart';
import '../../custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';

class ForgetPasswordView extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const ForgetPasswordView(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
        listener: (context, state) { },
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: kPrimaryColor,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: kPrimaryColor,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: widget.screenWidth * 0.05,
                            right: widget.screenWidth * 0.05,
                            top: widget.screenHeight * 0.15,
                            bottom: widget.screenHeight * 0.2,
                          ),
                          child: Text(
                            'BloodConnect',
                            style: TextStyle(
                              fontSize: widget.screenWidth * 0.1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.screenWidth * 0.001),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: widget.screenWidth * 0.025,
                                top: widget.screenHeight * 0.01,
                                bottom: widget.screenHeight * 0.01),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Creating New Password",
                                style: TextStyle(
                                  fontSize: widget.screenWidth * 0.06,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: widget.screenHeight * 0.015),
                          CustomTextFormField(
                            screenWidth: widget.screenWidth,
                            controller: cubit.passwordController1,
                            inputType: TextInputType.visiblePassword,
                            isPassword: cubit.isPassword1,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  cubit.isPassword1 = !cubit.isPassword1;
                                });
                              },
                              icon: Icon(
                                cubit.isPassword1 ? Icons.visibility_off : Icons.visibility,
                                color: kPrimaryColor,
                              ),
                            ),
                            hintText: "Enter new password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: widget.screenHeight * 0.015),
                          CustomTextFormField(
                            screenWidth: widget.screenWidth,
                            controller: cubit.passwordController2,
                            inputType: TextInputType.visiblePassword,
                            isPassword: cubit.isPassword2,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  cubit.isPassword2 = !cubit.isPassword2;
                                });
                              },
                              icon: Icon(
                                cubit.isPassword2 ? Icons.visibility_off : Icons.visibility,
                                color: kPrimaryColor,
                              ),
                            ),
                            hintText: "Re-enter new password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 50,),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: widget.screenHeight * 0.025,
                          //       horizontal: widget.screenWidth * 0.09),
                          //   child: Container(
                          //     alignment: Alignment.centerLeft,
                          //     child: Text(
                          //       "Password Strength:  Strong",
                          //       style: TextStyle(
                          //         fontSize: widget.screenWidth * 0.045,
                          //         color: Colors.black,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          CustomButtonConnection(buttonText: 'Submit', onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              if(cubit.passwordController1.text != cubit.passwordController2.text){
                                if (kDebugMode) {
                                  showScaffoldMessenger(
                                      context: context,
                                      message: "The two fields are not the same, try again",
                                      color: kPrimaryColor
                                  );
                                }
                              }
                              else{
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ResetPasswordView()),
                                );
                              }
                            }
                          },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
