import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class CustomCurvedNavBar extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final List<Widget> screens;
  const CustomCurvedNavBar({Key? key, required this.icon1, required this.icon2, required this.icon3, required this.screens}) : super(key: key);

  @override
  State<CustomCurvedNavBar> createState() => _CustomCurvedNavBarState();
}

class _CustomCurvedNavBarState extends State<CustomCurvedNavBar> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> navBarContent =[
      Icon(
        widget.icon1,
        size: 25,
        color: kPrimaryColor,
        fill: 1,
      ),
      Icon(
        widget.icon2,
        size: 25,
        color: kPrimaryColor,
        fill: 1,
      ),
      Icon(
        widget.icon3,
        size: 25,
        color: kPrimaryColor,
        fill: 1,
      ),
    ];

    return CurvedNavigationBar(
      index: currentIndex,
      backgroundColor: kPrimaryColor,
      animationDuration: const Duration(milliseconds: 300),
      items:navBarContent,
      onTap: (value) {
        setState(() {
          if(currentIndex != value) {
            currentIndex = value;
            const Duration(
             seconds: 1,
            );
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => widget.screens[currentIndex]));
          }
        },
        );
      },
    );
  }
}
