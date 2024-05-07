import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';

import 'forget_password.dart';
class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  static String id = "ResetPasswordView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context,constraints) {
          var email = ModalRoute.of(context)!.settings.arguments;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.07,
                    right: constraints.maxWidth * 0.07,
                    bottom: constraints.maxHeight * 0.2,
                  ),
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage("assets/images/reset_password.jpg"),
                        height: constraints.maxHeight * 0.32,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Text(
                        'Password Reset Email Sent',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.06,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          wordSpacing: 3,
                          fontFamily: "Ubuntu",
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.01,
                      ),
                      Text(
                        "ahmedraafat@gmail.com",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: constraints.maxWidth *0.032,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      Text(
                        "Your Account Security is Our Priority! We've Sent You a Secure"
                            " Link to Safety Change Your Password and Keep Your "
                            "Account Protected",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Ubuntu',
                          fontSize: constraints.maxWidth * 0.031,
                          height: 1.3
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.07,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.07,
                        child: MaterialButton(
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          onPressed: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context)=>const LoginView()
                                )
                            );
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.045,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.025,
                      ),
                      TextButton(
                          onPressed: (){
                            FirebaseAuth.instance.sendPasswordResetEmail(email: email.toString());
                            showScaffoldMessenger(
                                context: context,
                                message: "Email Link Sent to Reset your Password",
                                color: kPrimaryColor
                            );
                          },
                          child: const Text(
                            'Resend Email',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu"
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
