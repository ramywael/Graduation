import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/custom_button.dart';
import 'package:grad/custom_widgets/table_calender.dart';
import 'package:grad/screens/booking_donate_now/time_slot_container.dart';

class BookingScreenBody extends StatelessWidget {
  const BookingScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TableBasicsExample(),
        TimeSlotContainer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: CustomButton(text: "Confirm"),
        )
      ],
    );
  }
}
