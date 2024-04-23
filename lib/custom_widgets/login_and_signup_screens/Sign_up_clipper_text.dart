import 'package:flutter/material.dart';

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
      color: const Color(0xff81201a),
      height: screenHeight * 0.21,  // Adjusted height
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.001),
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
            SizedBox(height: screenHeight * 0.01),  // Adjusted spacing
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
