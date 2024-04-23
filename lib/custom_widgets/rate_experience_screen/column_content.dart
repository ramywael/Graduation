import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/rate_experience_screen/row_of_buttons.dart';

class ColumnWidgets extends StatelessWidget {
  const ColumnWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate the staff\'s friendliness',
          style: TextStyle(
            fontSize: screenWidth * 0.055, // 5.5% of screen width
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        Text(
          'Provide feedback for improvement',
          style: TextStyle(
            fontSize: screenWidth * 0.042, // 4.2% of screen width
            color: const Color(0xff7d7d7d),
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.055), // 1.5% of screen width
        Text(
          'Rate the cleanliness of the facility',
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.048, // 4.8% of screen width
          ),
        ),
        SizedBox(height: screenWidth * 0.020), // 1.2% of screen width
        const RowOfButtons(),
        SizedBox(height: screenWidth * 0.055), // 1.5% of screen width
        Text(
          'Rate the waiting time',
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.048, // 4.8% of screen width
          ),
        ),
        SizedBox(height: screenWidth * 0.020), // 1.2% of screen width
        const RowOfButtons(),
        SizedBox(height: screenWidth * 0.055), // 1.5% of screen width
        Text(
          'Rate the overall experience',
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.048, // 4.8% of screen width
          ),
        ),
        SizedBox(height: screenWidth * 0.020), // 1.2% of screen width
        const RowOfButtons(),
        SizedBox(height: screenWidth * 0.070), // 1.5% of screen width
        Container(
          alignment: Alignment.centerLeft,
          height: screenWidth * 0.16, // 12.5% of screen width
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.07), // 5% of screen width
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(1, 3),
                blurRadius: screenWidth * 0.015, // 1.5% of screen width
                spreadRadius: screenWidth * 0.0075, // 0.75% of screen width
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05), // 5% of screen width
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Provide Comments for improvement',
                hintStyle: TextStyle(
                  fontSize: screenWidth * 0.041, // 4% of screen width
                  color: const Color(0xff7d7d7d),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.05), // 2% of screen width
        Container(
          height: screenWidth * 0.15, // 10% of screen width
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff81201a),
            ),
            borderRadius: BorderRadius.circular(screenWidth * 0.03), // 2% of screen width
          ),
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              'Submit feedback',
              style: TextStyle(
                color: const Color(0xff81201a),
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.01), // 1% of screen width
      ],
    );
  }
}
