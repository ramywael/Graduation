import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, required this.isCurrentUser, required this.bottomRightBorderRadius, required this.bottomLeftBorderRadius});

  final String message;
  final bool isCurrentUser;
  final double bottomRightBorderRadius;
  final double bottomLeftBorderRadius;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: screenWidth * 0.045, // 4% of screen width
        top: screenWidth * 0.06, // 6% of screen width
        bottom: screenWidth * 0.06, // 6% of screen width
        right: screenWidth * 0.045, // 8% of screen width
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.023, // 4% of screen width
        vertical: screenWidth * 0.018, // 2% of screen width
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(screenWidth * 0.06),
          topLeft: Radius.circular(screenWidth * 0.06),
          bottomLeft: Radius.circular(bottomLeftBorderRadius),
          bottomRight: Radius.circular(bottomRightBorderRadius),
        ), // 10% of screen width
        color: isCurrentUser ? kPrimaryColor : const Color(0xfff0f0f0),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser ? Colors.white : Colors.black,
          fontFamily: 'Roboto',
          fontSize: screenWidth * 0.04, // 4% of screen width
        ),
      ),
    );
  }
}



