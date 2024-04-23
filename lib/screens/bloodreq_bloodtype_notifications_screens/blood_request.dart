import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/blood_request_screen/blood_request_content.dart';

class BloodRequest extends StatelessWidget {
  const BloodRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.chevron_back,
                size: 30,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      offset: const Offset(1, 3),
                      blurRadius: 6,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: const Icon(
                        Icons.bloodtype,
                        color: Color(0xff81201a),
                        size: 30,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    const Text(
                      'Request a Blood',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff81201a),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bloodtype_outlined,
                size: 40,
                color: Color(0xff81201a),
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: const BloodRequestContent(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, -2),
              blurRadius: 6,
            ),
          ],
        ),
        child: CurvedNavigationBar(
          height: 70,
          buttonBackgroundColor: Colors.white,
          onTap: (index) {},
          items: const [
            Icon(
              Icons.home,
              size: 35,
              color: Colors.black,
            ),
            Icon(
              Icons.bloodtype,
              size: 35,
              color: Colors.black,
            ),
            Icon(
              Icons.person,
              size: 35,
              color: Colors.black,
            )
          ],
          backgroundColor: const Color(0xff81201a),
          color: Colors.white,
          animationDuration: const Duration(milliseconds: 600),
        ),
      ),
    );
  }
}

