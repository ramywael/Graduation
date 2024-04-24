import 'package:flutter/material.dart';

class UrgentRequestsBloodRequestContainer extends StatelessWidget {
  final double screenWidth;
  const UrgentRequestsBloodRequestContainer(
      {Key? key, required this.screenWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth * 0.25,
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
      child: Row(
        children: [
          const Spacer(flex: 1),
          Text(
            '3',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: screenWidth * 0.075,
              fontFamily: 'Roboto-Regular',
              color: Colors.black,
            ),
          ),
          const Spacer(flex: 7),
          Text(
            'Urgent Request',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto-Regular',
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
