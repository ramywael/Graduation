import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/home/content_of_header_home_screen.dart';

class HeaderOfHomeScreen extends StatelessWidget {
  const HeaderOfHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.06,  // Adjusted based on screen height
        horizontal: screenWidth * 0.05,  // Adjusted based on screen width
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.064),  // Adjusted based on screen width
        boxShadow: kBoxShadow,
      ),
      child: const ContentOfHeaderHomePage(),
    );
  }
}
