import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class SignUpClipperText extends StatelessWidget {
  const SignUpClipperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
      // height: screenHeight * 0.21,  // Adjusted height
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
          top: screenHeight * 0.15,
          bottom: screenHeight * 0.2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Find Nearby Hospitals",
              style: TextStyle(
                fontSize: screenWidth * 0.08,  // Adjusted font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // Adjusted spacing
            Text(
              "Help save lives by donating blood today",
              style: TextStyle(
                fontSize: screenWidth * 0.04,  // Adjusted font size
                color: const Color(0xffded8d7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
