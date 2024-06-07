import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/screens/home/user_home_page.dart';

import '../../custom_widgets/user_notification/body_user_notification.dart';
import '../profile_and_rate_screens/profile.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return const Scaffold(
      // body: BodyUserNotification(screenWidth: screenWidth),
      bottomNavigationBar: CustomCurvedNavBar(
        icon1: Icons.home,
        icon2: Icons.notifications,
        icon3: Icons.person,
        screens: [
          HomePage(),
          UserNotifications(),
          ProfileView(),
        ],
      ),
    );
  }
}


