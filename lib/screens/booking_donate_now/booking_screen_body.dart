import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/custom_widgets/table_calender.dart';
import 'package:grad/screens/booking_donate_now/time_slot_container.dart';
import 'package:grad/screens/thanks_registration_loading_screens/thanks_for_saving_life.dart';

class BookingScreenBody extends StatelessWidget {
  final double screenWidth;
  final String bloodRequestId;
  final DateTime estimatedTime;
  const BookingScreenBody({Key? key, required this.screenWidth, required this.bloodRequestId, required this.estimatedTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableBasicsExample(
          estimatedTime: estimatedTime,
          screenWidth: screenWidth,
        ),
        TimeSlotContainer(
          screenWidth: screenWidth,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.045,
          ),
          child: CustomButton(
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.03,
            ),
            margin: EdgeInsets.symmetric(
              vertical: screenWidth * 0.03,
              horizontal: screenWidth * 0.05,
            ),
            color: kSecondaryColor,
            fontSize: screenWidth * 0.035,
            text: "Confirm",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ThanksForSavingLife(),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
