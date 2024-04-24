import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/signup.dart';
import '../../custom_widgets/login_and_signup_screens/custom_button.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xff81201a),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        width: double.infinity,
                        color: const Color(0xff81201a),
                        height: constraints.maxHeight * 0.29,
                        child: Padding(
                          padding: EdgeInsets.only(left: constraints.maxWidth * 0.05, right: constraints.maxWidth * 0.05, top: constraints.maxHeight * 0.04),
                          child:  Column(
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
                      height: constraints.maxHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: constraints.maxWidth * 0.1, top: constraints.maxHeight * 0.015),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child:  Text(
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
                      onSaved: (p0) {
                        emailController.text = p0!;
                      },
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.mark_email_read,
                        color: Color(0xff81201a),
                      ),
                      labelName: "E-mail Address",
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
                      labelName: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password must not be empty";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: constraints.maxWidth * 0.01,),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const ForgetPasswordView();
                                }));
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Color(0xff81201a),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    CustomButton(
                      buttonText: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
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
                                builder: (context) => const SignupView(),
                              ),
                            );
                          },
                          child:  Text(
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
