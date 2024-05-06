import 'package:flutter/material.dart';
import 'package:grad/screens/home/container_body_home_screen.dart';
import 'package:grad/screens/home/header_of_home_screen.dart';

class BodyHomeScreen extends StatelessWidget {

  const BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const HeaderOfHomeScreen(),
        ContainerHomeScreen(),
      ],
    );
  }
}

