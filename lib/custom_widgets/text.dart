import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color color;
  const CustomTextWidget({Key? key, required this.text, required this.fontSize,this.fontFamily="Roboto",this.fontWeight=FontWeight.bold, this.color=kPrimaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:  TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight:fontWeight,
      ),
    );
  }
}
