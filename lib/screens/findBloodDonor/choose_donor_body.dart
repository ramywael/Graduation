import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/findBloodDonor/list_view_donors.dart';

class ChooseDonorsBody extends StatelessWidget {
  final List donorList;
  const ChooseDonorsBody({Key? key, required this.donorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive font size
    final titleFontSize = screenWidth * 0.07;

    // Responsive padding
    final double topPadding = screenHeight * 0.03;
    final double leftPadding = screenWidth * 0.05;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: topPadding, left: leftPadding),
          child: CustomTextWidget(text: "Choose Donor", fontSize: titleFontSize),
        ),
         ListViewDonors(donorList: donorList,),
      ],
    );
  }
}


