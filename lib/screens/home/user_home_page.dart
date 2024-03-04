import 'package:flutter/material.dart';
import 'package:grad/screens/home/body_home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyHomeScreen(),
    );
  }
}

