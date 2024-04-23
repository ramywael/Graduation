import 'package:flutter/material.dart';


class RowOfUserData extends StatelessWidget {
  const RowOfUserData({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: screenWidth * 0.065,  // Adjusted size based on screen width
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjusted padding based on screen width
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: screenWidth * 0.04,  // Adjusted font size based on screen width
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
