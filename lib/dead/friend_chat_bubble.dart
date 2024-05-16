import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class FriendChatBubble extends StatelessWidget {
  const FriendChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
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
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
          color: kPrimaryColor,
        ),
        child: Text(
          'Sure! Share with me your nearest Hospitals',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }
}
