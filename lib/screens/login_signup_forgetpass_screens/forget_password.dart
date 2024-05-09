import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import '../../custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';
import 'login.dart';

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
  var passwordController1 = TextEditingController();
  var passwordController2 = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword1 = true;
  bool isPassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                      controller: passwordController1,
                      inputType: TextInputType.visiblePassword,
                      isPassword: isPassword1,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword1 = !isPassword1;
                          });
                        },
                        icon: Icon(
                          isPassword1 ? Icons.visibility_off : Icons.visibility,
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
                      controller: passwordController2,
                      inputType: TextInputType.visiblePassword,
                      isPassword: isPassword2,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword2 = !isPassword2;
                          });
                        },
                        icon: Icon(
                          isPassword2 ? Icons.visibility_off : Icons.visibility,
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: widget.screenHeight * 0.025,
                          horizontal: widget.screenWidth * 0.09),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password Strength:  Strong",
                          style: TextStyle(
                            fontSize: widget.screenWidth * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    CustomButtonConnection(buttonText: 'Submit', onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print(passwordController1.text);
                          print(passwordController2.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginView()),
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
  }
}
