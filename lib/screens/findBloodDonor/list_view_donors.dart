import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class ListViewDonors extends StatelessWidget {
  const ListViewDonors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalPadding = screenHeight * 0.02;

    // Responsive font sizes
    final titleFontSize = screenWidth * 0.05;
    final subtitleFontSize = screenWidth * 0.04;

    // Responsive icon size
    final iconSize = screenWidth * 0.12;

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        itemCount: 3, // Adjust itemCount based on your data
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: verticalPadding * 0.65),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kElevationToShadow[4],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.red, // Adjust color as needed
              ),
              title: Text(
                "John Doe",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "New York",
                style: TextStyle(
                  fontSize: subtitleFontSize,
                ),
              ),
              leading: SizedBox(
                width: iconSize,
                height: iconSize,
                child: Row(
                  children: [
                    Icon(
                      Icons.bloodtype,
                      size: iconSize * 0.5,
                      color: Colors.red, // Adjust color as needed
                    ),
                    Text(
                      "A+",
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.red, // Adjust color as needed
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}