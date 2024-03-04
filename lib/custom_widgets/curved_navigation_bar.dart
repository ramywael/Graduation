import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class CustomCurvedNavBar extends StatefulWidget {
  const CustomCurvedNavBar({Key? key}) : super(key: key);

  @override
  State<CustomCurvedNavBar> createState() => _CustomCurvedNavBarState();
}

class _CustomCurvedNavBarState extends State<CustomCurvedNavBar> {
  int currentIndex = 1;
  List<Widget> navBarContent =const[
    Icon(
      MaterialSymbolsIcons.Symbols.chat,
      size: 25,
      color: kPrimaryColor,
      fill: 1,
    ),
    Icon(
      MaterialSymbolsIcons.Symbols.home,
      size: 25,
      color: kPrimaryColor,
      fill: 1,
    ),
    Icon(
      MaterialSymbolsIcons.Symbols.person,
      size: 25,
      color: kPrimaryColor,
      fill: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      backgroundColor: kPrimaryColor,
      animationDuration: const Duration(milliseconds: 300),
      items:navBarContent,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
    );
  }
}
