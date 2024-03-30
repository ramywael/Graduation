import 'package:flutter/material.dart';
import 'package:grad/screens/booking_donate_now/booking_screen.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BookingScreen(),)
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff286E34),
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

