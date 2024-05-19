import 'package:flutter/material.dart';
import 'package:grad/screens/booking_donate_now/booking_screen_body.dart';

class BookingScreen extends StatelessWidget {
  final String bloodRequestId;
  final DateTime estimatedTime;
  final int bloodBracketCount;
  final String userRequestId;

  const BookingScreen({Key? key, required this.bloodRequestId, required this.estimatedTime, required this.bloodBracketCount, required this.userRequestId, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Schedule your donation",
          style: TextStyle(
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:  BookingScreenBody(screenWidth: screenWidth, bloodRequestId: bloodRequestId, estimatedTime: estimatedTime, bloodBracketCount: bloodBracketCount, userRequestId: userRequestId,),
    );
  }
}
