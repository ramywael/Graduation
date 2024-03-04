import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/home/content_of_header_home_screen.dart';

class HeaderOfHomeScreen extends StatelessWidget {
  const HeaderOfHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80,horizontal: 20),
      // width: 343,
      // height: 191,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: kBoxShadow,
      ),
      child: const ContentOfHeaderHomePage(),
    );
  }
}

