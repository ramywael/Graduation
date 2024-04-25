import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/sized_row_field_sign_up.dart';

import '../../constants/constant.dart';

class RowCityBloodType extends StatelessWidget {
  const RowCityBloodType({
    super.key,
    required this.screenWidth,
    required this.cityController,
    required this.cityAndBloodTypeWidth,
    required this.bloodTypeController,
  });

  final double screenWidth;
  final TextEditingController cityController;
  final double cityAndBloodTypeWidth;
  final TextEditingController bloodTypeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
      child: Row(
        children: [
          SizedFieldSignUp(
            screenWidth: screenWidth,
            controller: cityController,
            cityAndBloodTypeWidth: cityAndBloodTypeWidth,
            validator: (value) {
              if (value!.isEmpty && !value.contains(" ")) {
                return "Invalid Data";
              }
              return null;
            },
            icon: Icons.add_location_alt_sharp,
            labelText: 'City',
          ),
          SizedBox(width: screenWidth * 0.065),
          SizedFieldSignUp(
            screenWidth: screenWidth,
            controller: bloodTypeController,
            cityAndBloodTypeWidth: cityAndBloodTypeWidth,
            validator: (value) {
              if (value!.isEmpty &&
                  !value.contains(" ") &&
                  !bloodGroups.contains(value.toUpperCase())) {
                return "Invalid Data";
              }
              return null;
            },
            icon: Icons.bloodtype,
            labelText: 'Blood Type',
          ),
        ],
      ),
    );
  }
}
