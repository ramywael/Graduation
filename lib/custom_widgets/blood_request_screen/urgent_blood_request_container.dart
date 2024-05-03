import 'package:flutter/material.dart';

class UrgentRequestsBloodRequestContainer extends StatelessWidget {
  final double screenWidth;
  final Function() onIncrement;
  final int bloodBracketCount;
  final Function() onDecrement;
  const UrgentRequestsBloodRequestContainer(
      {Key? key, required this.screenWidth, required this.onIncrement, required this.onDecrement, required this.bloodBracketCount})
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
          IconButton(
              onPressed: onDecrement,
              icon: const Icon(
                Icons.remove,
              )),
          Text(
            '$bloodBracketCount',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: screenWidth * 0.075,
              fontFamily: 'Roboto-Regular',
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed:onIncrement,
              icon: const Icon(
                Icons.add,
              )),
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
