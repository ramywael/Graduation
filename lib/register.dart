import 'package:flutter/material.dart';
import 'package:grad/screens/bloodreq_bloodtype_notifications_screens/blood_request.dart';
import 'package:grad/screens/bloodreq_bloodtype_notifications_screens/blood_type.dart';
import 'package:grad/screens/booking_donate_now/booking_screen.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/chatbot.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/rate_experience.dart';
import 'package:grad/screens/donateNowCategory/eligibility_check.dart';
import 'package:grad/screens/findBloodDonor/choose_donor.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/forget_password.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';
import 'package:grad/screens/onBoarding/onBoarding.dart';
import 'package:grad/screens/requestablood/request_a_blood.dart';
import 'package:grad/screens/thanks_registration_loading_screens/registration_loading.dart';
import 'package:grad/screens/thanks_registration_loading_screens/thanks_for_saving_life.dart';
import 'package:grad/screens/thanks_registration_loading_screens/thanks_for_using_app.dart';

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
      home: const ThanksForUsingApp(),
    );
  }
}


