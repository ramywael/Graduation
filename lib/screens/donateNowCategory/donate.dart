import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/donateNowCategory/donate_container.dart';
import 'package:grad/screens/donateNowCategory/search_bar.dart';

class DonateNow extends StatelessWidget {
  const DonateNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchComponent(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
              ),
              child: CustomTextWidget(
                text: "Blood Donation Requests",
                fontSize: screenWidth * 0.065,
                color: Colors.black,
              ),
            ),
            DonateContainer(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            DonateContainer(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}
