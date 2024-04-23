import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/blood_request_screen/blood_request_content.dart';

class BloodRequest extends StatelessWidget {
  const BloodRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        toolbarHeight: 100,
        title: Row(
          children: [
            IconButton(
              onPressed: (){},
              icon: const Icon(CupertinoIcons.chevron_back,
                size: 30,
              ),
            ),
            Container(
              height: 40,
              width: 260,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.bloodtype,
                      color: Color(0xff81201a),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 12,),
                  Text(
                    'Request a Blood',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff81201a),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.bloodtype_outlined,
              size: 40,
              color: Color(0xff81201a),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(22.0),
          child: BloodRequestContent(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset: const Offset(1, 4),
              blurRadius: 6,
              spreadRadius: 6,
            ),
          ],
        ),
        child: CurvedNavigationBar(
          height: 70,
          buttonBackgroundColor: Colors.white,
          onTap: (index){},
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
