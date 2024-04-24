import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/custom_widgets/table_calender.dart';
import 'package:grad/screens/booking_donate_now/time_slot_container.dart';

class BookingScreenBody extends StatelessWidget {
  final double screenWidth;
  const BookingScreenBody({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         TableBasicsExample(screenWidth: screenWidth,),
         TimeSlotContainer(screenWidth: screenWidth,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*0.045,),
          child: const CustomButton(text: "Confirm"),
        )
      ],
    );
  }
}
