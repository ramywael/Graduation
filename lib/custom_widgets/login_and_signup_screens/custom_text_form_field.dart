import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    required this.labelName,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool isPassword;
  final String labelName;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 5, horizontal: MediaQuery.of(context).size.width * 0.065),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(1, 3),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: TextFormField(
            onSaved: onSaved,
            controller: controller,
            keyboardType: inputType,
            obscureText: isPassword,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    0.04), // Set a base font size
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 0.01,
              ),
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelText: validator != null && validator!(controller.text) != null
                      ? validator!(controller.text)
                      : labelName,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width *
                    0.04, // Set font size based on screen width
                color: validator!= null && validator!(controller.text)!=null ? Colors.red :Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
