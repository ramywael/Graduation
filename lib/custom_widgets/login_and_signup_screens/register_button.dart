import 'package:flutter/material.dart';

import '../../screens/home/user_home_page.dart';
import 'custom_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.formKey,
  });

  final double screenWidth;
  final double screenHeight;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.09,
          vertical: screenHeight * 0.015),
      child: CustomButton(
        buttonText: "Register",
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
