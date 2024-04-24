
import 'package:flutter/material.dart';

class TimeBloodRequestContainer extends StatelessWidget {
  const TimeBloodRequestContainer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth * 0.25,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            offset: const Offset(1, 3),
            blurRadius: 6,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.1),
        child: Text(
          '10/15/2022',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: screenWidth * 0.06,
            fontFamily: 'Roboto-Regular',
          ),
        ),
      ),
    );
  }
}

