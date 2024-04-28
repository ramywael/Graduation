import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/home/body_home_screen.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';

class HomePage extends StatelessWidget {
  final  bool isDonated;
  const HomePage({super.key, this.isDonated=true});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BodyHomeScreen(isDonated: isDonated,),
    );
  }
}

