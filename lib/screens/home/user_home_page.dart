import 'package:flutter/material.dart';
import 'package:grad/screens/home/body_home_screen.dart';

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

