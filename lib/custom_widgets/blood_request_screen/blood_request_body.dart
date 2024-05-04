import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import 'blood_request_content.dart';

class BloodRequestBody extends StatelessWidget {
  final String bloodType;
  final UrgencyLevel urgencyLevel;
  const BloodRequestBody({
    super.key,
    required this.screenWidth, required this.bloodType, required this.urgencyLevel,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child:  BloodRequestContent(bloodType: bloodType, urgencyLevel: urgencyLevel,),
      ),
    );
  }
}

