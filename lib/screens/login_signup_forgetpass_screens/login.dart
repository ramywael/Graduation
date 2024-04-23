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
  const LoginView({super.key});

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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                width: double.infinity,
                color: const Color(0xff81201a),
                height: 200,
                child: const Padding(
                  padding: EdgeInsets.only(left: 18, right: 18, top: 40),
                  child: Column(
                    children: [
                      Text(
                        "Welcome To BloodChain",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
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
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 15),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
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
                  const SizedBox(
                    height: 15,
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
                    padding: const EdgeInsets.only(right: 15),
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
                  // const SizedBox(
                  //   height: 40,
                  // ),
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
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t Have An Account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: Color(0xff81201a),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
