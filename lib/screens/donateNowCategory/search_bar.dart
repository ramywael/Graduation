import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class SearchComponent extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const SearchComponent(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.015,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: BorderRadius.circular(
          screenWidth * 0.05,

        ),
      ),
      child:  TextField(
        decoration: InputDecoration(
          hintText: "Search by Blood Group",
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: screenHeight * 0.03,
          ),
        ),
      ),
    );
  }
}
