import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/findBloodDonor/choose_donor_body.dart';

class ChooseDonor extends StatelessWidget {
  const ChooseDonor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kBoxShadow,
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
              title: const CustomTextWidget(
                text: "Blood Connect",
                fontSize: 30,
              ),
            ),
          ),
        ),
        body:  const ChooseDonorsBody(),
    );
  }
}

