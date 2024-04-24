import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import '../../constants/constant.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class UserNotifications extends StatelessWidget {
  const UserNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: kBoxShadow,
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      MaterialSymbolsIcons.Symbols.heart_check_rounded,
                      fill: 1,
                      size: 30,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Your donation request has been accepted!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.048,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.08,
                ),
                // const CustomButton(text: "Details"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
