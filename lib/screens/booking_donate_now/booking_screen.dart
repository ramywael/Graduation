import 'package:flutter/material.dart';
import 'package:grad/screens/booking_donate_now/booking_screen_body.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

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
      body:  BookingScreenBody(screenWidth: screenWidth,),
    );
  }
}
