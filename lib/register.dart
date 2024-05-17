import 'package:flutter/material.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/reset_password.dart';
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


