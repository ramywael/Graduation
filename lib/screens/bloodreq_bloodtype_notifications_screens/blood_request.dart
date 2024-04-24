import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/profile.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../../custom_widgets/blood_request_screen/app_bar_title.dart';
import '../../custom_widgets/blood_request_screen/blood_request_body.dart';

class BloodRequest extends StatelessWidget {
  const BloodRequest({Key? key}) : super(key: key);

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
      body: BloodRequestBody(screenWidth: screenWidth),
      bottomNavigationBar: const CustomCurvedNavBar(
        icon1: Icons.home,
        icon2: Icons.bloodtype,
        icon3: Icons.person,
        screens: [
          HomePage(),
          BloodRequest(),
          ProfileView(),
        ],
      ),
    );
  }
}

