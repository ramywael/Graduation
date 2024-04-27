import 'package:flutter/material.dart';
import 'custom_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.onPressed,
  });

  final double screenWidth;
  final double screenHeight;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.09,
        vertical: screenHeight * 0.015,
      ),
      child: CustomButton(
        buttonText: "Register",
        onPressed: onPressed,
      ),
    );
  }
}
