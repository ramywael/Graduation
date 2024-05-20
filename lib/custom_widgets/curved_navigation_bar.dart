import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class CustomCurvedNavBar extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final List<Widget> screens;
  final double? navBarWidth;

  const CustomCurvedNavBar({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.screens, this.navBarWidth,
  }) : super(key: key);

  @override
  State<CustomCurvedNavBar> createState() => _CustomCurvedNavBarState();
}

class _CustomCurvedNavBarState extends State<CustomCurvedNavBar> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<Widget> navBarContent = [
      Icon(
        widget.icon1,
        size: screenWidth * 0.06, // Adjusted icon size
        color: kPrimaryColor,
        fill: 1,
      ),
      Icon(
        widget.icon2,
        size: screenWidth * 0.06, // Adjusted icon size
        color: kPrimaryColor,
        fill: 1,
      ),
      Icon(
        widget.icon3,
        size: screenWidth * 0.06, // Adjusted icon size
        color: kPrimaryColor,
        fill: 1,
      ),
    ];

    return CurvedNavigationBar(
     // height: screenWidth * 0.135, // Adjusted height
      height: widget.navBarWidth ?? screenWidth * 0.14, // Adjusted height
      index: currentIndex,
      backgroundColor: kPrimaryColor,
      animationDuration: const Duration(milliseconds: 300),
      items: navBarContent,
      onTap: (value) {
        setState(() {
          if (currentIndex != value) {
            currentIndex = value;
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => widget.screens[currentIndex],
            ),
          );
        });
      },
    );
  }
}
