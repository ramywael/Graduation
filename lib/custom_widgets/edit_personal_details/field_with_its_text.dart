import 'package:flutter/material.dart';
import '../login_and_signup_screens/custom_text_form_field.dart';

class FieldAndItsText extends StatelessWidget {
  const FieldAndItsText({super.key,
    required this.screenWidth,
    required this.controller,
    required this.type,
    required this.hintText,
    required this.text
  });
  final String text;
  final TextEditingController controller;
  final TextInputType type;
  final double screenWidth;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: screenWidth * 0.047
            ),
          ),
        ),
        CustomTextFormField(
          controller: controller,
          inputType: type,
          hintText: hintText,
          screenWidth: screenWidth * 0.9,
        )
      ],
    );
  }
}
