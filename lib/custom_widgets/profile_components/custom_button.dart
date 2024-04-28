import 'package:flutter/material.dart';
import 'package:grad/screens/booking_donate_now/booking_screen.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final double? screenWidth;
  final double? screenHeight;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.fontSize,
    this.padding,
    this.margin,
    this.isLoading = false, this.screenWidth, this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(screenWidth! * 0.08),
        ),
        child: isLoading == true ? SizedBox(
          height: screenHeight! * 0.06,
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ) :Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
