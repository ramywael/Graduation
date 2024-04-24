import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../../screens/booking_donate_now/booking_screen.dart';
import '../profile_components/custom_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
as MaterialSymbolsIcons;


class DetailsContainerUserNotification extends StatelessWidget {
  final double screenWidth;
  const DetailsContainerUserNotification({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  MaterialSymbolsIcons.Symbols.heart_check_rounded,
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
          SizedBox(
            height: screenWidth * 0.03,
          ),
          CustomButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BookingScreen(),
                ),
              );
            },
            text: "Details",
            color: kPrimaryColor,
            fontSize: screenWidth * 0.04,
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.02,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
            ),
          )
        ],
      ),
    );
  }
}