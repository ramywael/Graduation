import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.controller,
    required this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword=false,
    required this.labelName,
    this.validator,
    this.onSaved
  });

  final TextEditingController controller ;
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
      padding: const EdgeInsets.only(top: 15,right: 22.0,left: 22.0),
      child: Card(
        shape: const CircleBorder(eccentricity: 1),
        child: Container(
          height: 50,
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              label: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  labelName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey
                  ),),
              ),
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}