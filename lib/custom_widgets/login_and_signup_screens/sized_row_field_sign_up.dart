import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class SizedFieldSignUp extends StatelessWidget {
  const SizedFieldSignUp({
    super.key,
    required this.screenWidth,
    required this.controller,
    required this.cityAndBloodTypeWidth,
    required this.icon,
    this.validator,
    required this.labelText,
  });

  final double screenWidth;
  final TextEditingController controller;
  final double cityAndBloodTypeWidth;
  final IconData icon;
  final String? Function(String?)? validator;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(eccentricity: 1),
      child: Container(
        height: screenWidth * 0.12, // Adjusted based on screen width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
              screenWidth * 0.06), // Adjusted based on screen width
          boxShadow: kBoxShadow,
        ),
        child: SizedBox(
          width: screenWidth * 0.35, // Adjusted based on screen width
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 0.01,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  screenWidth * 0.05,
                ), // Adjusted based on screen width
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                icon,
                color: kPrimaryColor,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:
                    screenWidth * 0.038, // Set font size based on screen width
                color: validator != null && validator!(controller.text) != null
                    ? Colors.red
                    : Colors.grey,
              ),
              labelText:
                  validator != null && validator!(controller.text) != null
                      ? validator!(controller.text)
                      : labelText,
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
