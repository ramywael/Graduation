import 'package:flutter/material.dart';

class NotificationComponent extends StatelessWidget {
  const NotificationComponent({
    super.key,
    required this.image,
    required this.name,
    required this.notification,
  });

  final String? image;
  final String name;
  final String notification;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenWidth * 0.125,  // Adjusted height based on screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.075),  // Adjusted borderRadius based on screen width
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            offset: const Offset(1, 3),
            blurRadius: screenWidth * 0.015,  // Adjusted blurRadius based on screen width
            spreadRadius: screenWidth * 0.0075,  // Adjusted spreadRadius based on screen width
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04),  // Adjusted padding based on screen width
            child: CircleAvatar(
              radius: screenWidth * 0.034,  // Adjusted radius based on screen width
              backgroundImage: AssetImage(image!),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.01),  // Adjusted padding based on screen width
            child: SizedBox(
              width: screenWidth * 0.16,  // Adjusted width based on screen width
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: screenWidth * 0.034,  // Adjusted font size based on screen width
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),  // Adjusted padding based on screen width
            child: Container(
              alignment: Alignment.centerLeft,
              height: screenWidth * 0.085,  // Adjusted height based on screen width
              width: screenWidth * 0.25,  // Adjusted width based on screen width
              child: Text(
                notification,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: screenWidth * 0.032,  // Adjusted font size based on screen width
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
