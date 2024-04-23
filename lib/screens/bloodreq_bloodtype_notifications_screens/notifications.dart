import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom_widgets/notification.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double seprateBetweenNotification = screenWidth * 0.045;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Icon(
            Icons.arrow_back,
            size: screenWidth * 0.075,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            letterSpacing: 0.8,
            fontSize: screenWidth * 0.075,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        toolbarHeight: screenWidth * 0.1,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.065),
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: screenWidth * 0.05,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 0.09,
              ),
              Text(
                'Today\'s Updates',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(
                height: screenWidth * 0.02,
              ),
              const NotificationComponent(
                image: "assets/images/image.jpeg",
                name: 'lea.9',
                notification: 'Has selected a slot',
              ),
              SizedBox(
                height: seprateBetweenNotification,
              ),
              const NotificationComponent(
                image: "assets/images/image.jpeg",
                name: 'lea.9',
                notification: 'Has submitted a recipient request',
              ),
              SizedBox(
                height: screenWidth * 0.09,
              ),
              Text(
                'This Week',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                    fontFamily: 'Montserrat'
                ),
              ),
              const SizedBox(
                height:10 ,
              ),
              const NotificationComponent(
                  image: "assets/images/image.jpeg",
                  name: 'badboy',
                  notification: 'is waiting for an action'),
               SizedBox(
                height:seprateBetweenNotification,
              ),
              const NotificationComponent(
                  image: "assets/images/image.jpeg",
                  name: 'badboy',
                  notification: 'Has submitted a recipient request'),
               SizedBox(
                height:screenWidth * 0.09,
              ),

              //-----------------------------------------------------------

               Text(
                'Earlier today',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: screenWidth * 0.05,
                    fontFamily: 'Montserrat'
                ),
              ),
               SizedBox(
                height: screenWidth * 0.02,
              ),
              const NotificationComponent(
                  image: "assets/images/image.jpeg",
                  name: 'kelly.f',
                  notification: 'Donation if done'),
               SizedBox(
                height: seprateBetweenNotification,
              ),
              const NotificationComponent(
                  image: "assets/images/image.jpeg",
                  name: 'livia-178',
                  notification: 'Sent Donation Feedback'
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100]!,
              offset: const Offset(1, 2),
              blurRadius: 0,
            ),
          ],
        ),
        height: screenWidth * 0.1,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: const Color(0xff413d3d),
                size: screenWidth * 0.07,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/images/hospital_logo.png'),
                color: const Color(0xff413d3d),
                size: screenWidth * 0.085,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/hand-holding-medical.svg',
                color: const Color(0xff413d3d),
                height: screenWidth * 0.06,
              ),
              label: '',
            ),
          ],
          selectedFontSize: 0,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff81201a),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {},
        ),
      ),
    );
  }
}
