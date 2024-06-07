import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../../custom_widgets/blood_request_screen/app_bar_title.dart';
import '../../custom_widgets/blood_request_screen/blood_request_body.dart';
import '../profile_and_rate_screens/profile.dart';

class BloodRequest extends StatelessWidget {
  final String bloodType;
  final UrgencyLevel urgencyLevel;
  const BloodRequest({Key? key, required this.bloodType, required this.urgencyLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: TitleAppBarBloodRequest(screenWidth: screenWidth),
      ),
      body: BloodRequestBody(screenWidth: screenWidth, bloodType: bloodType, urgencyLevel: urgencyLevel,),
      bottomNavigationBar:  CustomCurvedNavBar(
        icon1: Icons.home,
        icon2: Icons.bloodtype,
        icon3: Icons.person,
        screens: [
          const HomePage(),
          BloodRequest(
            bloodType: bloodType,
            urgencyLevel: urgencyLevel,
          ),
          const ProfileView(),
        ],
      ),
    );
  }
}

