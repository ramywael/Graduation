import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/donateNowCategory/donate_container.dart';
import 'package:grad/screens/donateNowCategory/search_bar.dart';
class DonateNow extends StatelessWidget {
  const DonateNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchComponent(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextWidget(
              text: "Blood Donation Requests",
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          DonateContainer(),
          DonateContainer(),
        ],
      ),
    );
  }
}


