import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/findBloodDonor/choose_donor_body.dart';

class ChooseDonor extends StatelessWidget {
  const ChooseDonor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive font size
    final titleFontSize = screenWidth * 0.07;

    // Responsive padding
    final double verticalPadding = screenHeight * 0.005;
    final double horizontalPadding = screenWidth * 0.005;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[2],
          ),
          child: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
            title: CustomTextWidget(
              text: "Blood Connect",
              fontSize: titleFontSize,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: const ChooseDonorsBody(),
      ),
    );
  }
}
