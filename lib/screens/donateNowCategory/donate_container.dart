import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/donate_request_time/select_time_request_cubit.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/custom_widgets/text.dart';
import '../booking_donate_now/booking_screen.dart';

class DonateContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String bloodType;
  final String urgencyLevel;
  final String bloodRequestId;
  final DateTime estimatedTime;
  final int bloodBracketCount;
  final String userRequestId;
  final bool isFull;

  const DonateContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.bloodType,
    required this.urgencyLevel,
    required this.bloodRequestId,
    required this.estimatedTime,
    required this.userRequestId,
    required this.bloodBracketCount, required this.isFull,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isFull ? Colors.transparent : Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.021,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "Hospital Name",
              fontSize: screenHeight * 0.024,
              color: Colors.black,
            ),
            CustomTextWidget(
              text: "Blood Type : $bloodType",
              fontSize: screenHeight * 0.02,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            CustomTextWidget(
              text: "Urgency : $urgencyLevel",
              fontSize: screenHeight * 0.02,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            CustomTextWidget(
              text:
                  "Time Estimated : ${estimatedTime.difference(DateTime.now()).inDays + 1} day",
              fontSize: screenHeight * 0.02,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            CustomButton(
              color: kSecondaryColor,
              text: isFull ?"Pending" :"Donate",
              fontSize: screenHeight * 0.018,
              margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.012,
              ),
              onTap: isFull ?(){
                showScaffoldMessenger(
                  context: context,
                  message: "This request is already full",
                  color: kSecondaryColor,
                );
              } :() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (BuildContext context) {
                        return SelectTimeRequestCubit();
                      },
                      child: BookingScreen(
                        userRequestId: userRequestId,
                        bloodRequestId: bloodRequestId,
                        estimatedTime: estimatedTime,
                        bloodBracketCount: bloodBracketCount,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

