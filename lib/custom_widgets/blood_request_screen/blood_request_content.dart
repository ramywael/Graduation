import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/blood_request_screen/time_blood_request_container.dart';
import 'package:grad/custom_widgets/blood_request_screen/urgent_blood_request_container.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/screens/thanks_registration_loading_screens/thanks_for_using_app.dart';
import 'attached_blood_request_container.dart';

class BloodRequestContent extends StatelessWidget {
  const BloodRequestContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Blood',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        UrgentRequestsBloodRequestContainer(screenWidth: screenWidth),
        SizedBox(height: screenWidth * 0.09),
        const Text(
          'Attached',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        AttachedBloodRequestContainer(screenWidth: screenWidth),
        SizedBox(height: screenWidth * 0.09),
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        TimeBloodRequestContainer(screenWidth: screenWidth),
        SizedBox(height: screenWidth * 0.07),
        Center(
          child: Container(
            width: screenWidth * 0.4,
            height: screenWidth * 0.13,
            decoration: BoxDecoration(
              color: const Color(0xff81201a),
              borderRadius: BorderRadius.circular(45),
            ),
            child: CustomButton(
              text: "Submit",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThanksForUsingApp(),
                  ),
                );
              },
              color: kPrimaryColor,
              fontSize: screenWidth * 0.055,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenWidth * 0.02,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
