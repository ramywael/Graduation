import 'package:flutter/material.dart';
import 'package:grad/screens/bloodreq_bloodtype_notifications_screens/blood_request.dart';
import 'package:grad/screens/booking_donate_now/booking_screen.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/chatbot.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/rate_experience.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:grad/screens/onBoarding/onBoarding.dart';

class DonationBlood extends StatelessWidget {
  const DonationBlood({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BloodRequest(),
    );
  }
}


