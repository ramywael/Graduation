import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/sign_up_body_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff81201a),
        elevation: 0,
      ),
      body: const SignUpBody(),
    );
  }
}


