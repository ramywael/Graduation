import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/findBloodDonor/list_view_donors.dart';

class ChooseDonorsBody extends StatelessWidget {
  const ChooseDonorsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30,left: 20),
          child: CustomTextWidget(text: "Choose Donor", fontSize: 24),
        ),
        ListViewDonors(),
      ],
    );
  }
}


