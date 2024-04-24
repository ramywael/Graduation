import 'package:flutter/material.dart';

import 'blood_request_content.dart';

class BloodRequestBody extends StatelessWidget {
  const BloodRequestBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: const BloodRequestContent(),
      ),
    );
  }
}

