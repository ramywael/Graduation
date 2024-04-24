import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../custom_widgets/login_and_signup_screens/custom_button.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';
import 'login.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
        backgroundColor: const Color(0xff81201a),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
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
                  color: const Color(0xff81201a),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.09),
                    child: Text(
                      'BloodConnect',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.001),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.025, top: MediaQuery.of(context).size.height*0.01,bottom: MediaQuery.of(context).size.height * 0.01),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Creating New Password",
                          style: TextStyle(
                            fontSize:  MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    CustomTextFormField(
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
                          color: const Color(0xff81201a),
                        ),
                      ),
                      labelName: "Enter new password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        }
                        return null;
                      },
                    ),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    CustomTextFormField(
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
                          color: const Color(0xff81201a),
                        ),
                      ),
                      labelName: "Re-enter new password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.025,horizontal: MediaQuery.of(context).size.width * 0.09),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password Strength:  Strong",
                          style: TextStyle(
                            fontSize:  MediaQuery.of(context).size.width * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height * 0.045),
                    CustomButton(
                      buttonText: "Submit",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (kDebugMode) {
                            print(passwordController1.text);
                            print(passwordController2.text);
                            Navigator.push(
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

