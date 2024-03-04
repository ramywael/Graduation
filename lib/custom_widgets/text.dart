import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  const CustomTextWidget({Key? key, required this.text, required this.fontSize,this.fontFamily="Roboto",this.fontWeight=FontWeight.bold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:  TextStyle(
        color: kPrimaryColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight:fontWeight,
      ),
    );
  }
}
