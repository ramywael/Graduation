import 'package:flutter/material.dart';

class MyChatBubble extends StatelessWidget {
  const MyChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: screenWidth * 0.045, // 4% of screen width
          top: screenWidth * 0.07, // 6% of screen width
          bottom: screenWidth * 0.07, // 6% of screen width
          right: screenWidth * 0.08, // 8% of screen width
        ),
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.025, // 4% of screen width
          vertical: screenWidth * 0.023, // 2% of screen width
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.1), // 10% of screen width
          color: const Color(0xfff0f0f0),
        ),
        child: Text(
          'Hi I am in a hurry to get blood can you donate today to me?',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: screenWidth * 0.04, // 4% of screen width
          ),
        ),
      ),
    );
  }
}



