import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/findBloodDonor/choose_donor.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/forget_password.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/reset_password.dart';
import 'package:grad/screens/onBoarding/onBoarding.dart';
import 'package:grad/screens/profile_and_rate_screens/profile.dart';
class DonationBlood extends StatelessWidget {
  const DonationBlood({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      // home: (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified)
      //     ? const HomePage()
      //     : const SplashScreen(),                /// This is the original code


      home: const SplashScreen(),
      routes: {
        ResetPasswordView.id : (context)=>  const ResetPasswordView(),
      },
    );
  }
}


