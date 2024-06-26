import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/log_in_cubit/login_cubit.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/reset_password.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/signup.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';
import 'forget_password.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        width: double.infinity,
                        color: kPrimaryColor,
                        //height: constraints.maxHeight * 0.21,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: constraints.maxHeight * 0.15,
                            bottom: constraints.maxHeight * 0.2,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Welcome To BloodChain",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.08,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Log in to Donate Blood and Save Lives!",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: constraints.maxWidth * 0.1,
                          top: constraints.maxHeight * 0.01),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    CustomTextFormField(
                      screenWidth: constraints.maxWidth,
                      onSaved: (p0) {
                        emailController.text = p0!;
                      },
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.mark_email_read,
                        color: Color(0xff81201a),
                      ),
                      hintText: "E-mail Address",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Email must not be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.015,
                    ),
                    CustomTextFormField(
                      screenWidth: constraints.maxWidth,
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      controller: passwordController,
                      inputType: TextInputType.visiblePassword,
                      isPassword: isPassword,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff81201a),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xff81201a),
                        ),
                      ),
                      hintText: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password must not be empty";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: constraints.maxWidth * 0.01,
                      ),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            if(emailController.text == ''){
                              showScaffoldMessenger(
                                  context: context,
                                  message: "Enter your email before clicking forget password",
                                  color: kPrimaryColor
                              );
                            }
                            else {
                              Navigator.pushReplacementNamed(
                                context,
                                ResetPasswordView.id,
                                arguments: emailController.text,
                              );
                              FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                            }
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.01,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) => CustomButtonConnection(
                        isLoading: state is LoginLoading,
                        buttonText: "Login",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            BlocProvider.of<LoginCubit>(context).login(
                                emailAddress: emailController.text,
                                password: passwordController.text,
                                context: context,
                            );
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t Have An Account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: constraints.maxWidth * 0.039,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (BuildContext context) =>
                                        SignUpCubit(),
                                    child: const SignupView()),
                              ),
                            );
                          },
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              color: const Color(0xff81201a),
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxWidth * 0.039,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
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
