import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/screens/chatbot/chatbot.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../../custom_widgets/blood_type_container.dart';

import '../profile_and_rate_screens/profile.dart';

class BloodType extends StatelessWidget {
  const BloodType({super.key});

  final List<BloodTypeContainer> bloodTypes = const [
    BloodTypeContainer(
      bloodType: "A+",
      name: "Sarah Johnson",
      governorate: "Los Angeles",
      timeLimit: "2 days",
    ),
    BloodTypeContainer(
      bloodType: "O-",
      name: "Michael Watson",
      governorate: "New York",
      timeLimit: "1 days",
    ),
    BloodTypeContainer(
      bloodType: "B+",
      name: "Emily Parker",
      governorate: "Chicago",
      timeLimit: "3 days",
    ),
    BloodTypeContainer(
      bloodType: "A+",
      name: "Sarah Johnson",
      governorate: "Los Angeles",
      timeLimit: "2 days",
    ),
    BloodTypeContainer(
      bloodType: "O-",
      name: "Michael Watson",
      governorate: "New York",
      timeLimit: "1 days",
    ),
    BloodTypeContainer(
      bloodType: "B+",
      name: "Emily Parker",
      governorate: "Chicago",
      timeLimit: "3 days",
    ),
    BloodTypeContainer(
      bloodType: "A+",
      name: "Sarah Johnson",
      governorate: "Los Angeles",
      timeLimit: "2 days",
    ),
    BloodTypeContainer(
      bloodType: "O-",
      name: "Michael Watson",
      governorate: "New York",
      timeLimit: "1 days",
    ),
    BloodTypeContainer(
      bloodType: "B+",
      name: "Emily Parker",
      governorate: "Chicago",
      timeLimit: "3 days",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double paddingValue = screenWidth > 600 ? 50.0 : 15.0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(1, 3),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: AppBar(
            toolbarHeight: 85,
            scrolledUnderElevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {},
              icon: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            title: const Text(
              'BloodConnect',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Roboto-Regular',
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: paddingValue),
        child: ListView.builder(
          itemCount: bloodTypes.length,
          itemBuilder: (context, index) {
            return bloodTypes[index];
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              offset: const Offset(1, 2),
              blurRadius: 2,
              spreadRadius: 5,
            ),
          ],
        ),
        height: 45,
        child: const CustomCurvedNavBar(
            icon1: Icons.chat,
            icon2: Icons.home,
            icon3: Icons.person,
            screens: [
              Chatbot(screenName: BloodType()),
              HomePage(),
              ProfileView(),
            ],
        ),
      ),
    );
  }
}

