import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class TimeBloodRequestContainer extends StatelessWidget {
  const TimeBloodRequestContainer({
    super.key,
    required this.screenWidth, required this.onDateChanged, required this.selectedDate,
  });

  final double screenWidth;
  final Function() onDateChanged;

   final DateTime selectedDate;

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
      child: ListTile(
        title: Text(
          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: screenWidth * 0.06,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        trailing: IconButton(
          onPressed: onDateChanged,
          icon: Icon(
            Icons.calendar_today,
            color: kPrimaryColor,
            size: screenWidth * 0.08,
          ),
        ),
      ),
    );
  }
}
