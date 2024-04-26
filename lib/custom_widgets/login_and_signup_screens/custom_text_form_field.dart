import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    required this.hintText,
    this.validator,
    this.onSaved,
    required this.screenWidth, this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool isPassword;
  final String hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double screenWidth;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.015, horizontal: screenWidth * 0.065),
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
        ), // Set a base font size
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
            borderSide:  BorderSide(color: Colors.grey[100]!),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
            borderSide: const BorderSide(color: Colors.grey,),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
            borderSide: const BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06, // Adjusted based on screen width
          ),
        ),
        validator: validator,
      ),
    );
  }
}
