import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/custom_widgets/text.dart';

class DonateContainer extends StatelessWidget {
  const DonateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "Hospital Name",
              fontSize: 18,
              color: Colors.black,
            ),
            CustomTextWidget(
              text: "Blood Type: A+",
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            CustomTextWidget(
              text: "Urgency: High",
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            CustomTextWidget(
              text: "Distance: 2.5km",
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            // CustomButton(
            //   text: "Donate Now",
            // )
          ],
        ),
      ),
    );
  }
}
