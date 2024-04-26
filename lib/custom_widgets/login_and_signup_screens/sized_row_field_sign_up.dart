import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Expanded(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
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
            color: Colors.grey,
          ),
          hintText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
