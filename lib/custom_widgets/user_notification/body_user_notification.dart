import 'package:flutter/material.dart';
import '../../constants/constant.dart';

import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

import 'details_user_notification_container.dart';

class BodyUserNotification extends StatelessWidget {
  const BodyUserNotification({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DetailsContainerUserNotification(screenWidth: screenWidth),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.09,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenWidth * 0.01,
          ),
          decoration: BoxDecoration(
            boxShadow: kBoxShadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.034,
                  vertical: screenWidth * 0.02,
                ),
                child: Row(
                  children: [
                    Icon(
                      MaterialSymbolsIcons.Symbols.volunteer_activism,
                      fill: 1,
                      size: screenWidth * 0.14,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        "Your donation request has been accepted!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                          fontFamily: "Roboto",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
