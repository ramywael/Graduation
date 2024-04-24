import 'package:flutter/material.dart';

class TitleAppBarBloodRequest extends StatelessWidget {
  const TitleAppBarBloodRequest({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                screenWidth * 0.05,
              ),
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
                  child: Icon(
                    Icons.bloodtype,
                    color: const Color(0xff81201a),
                    size: screenWidth * 0.08,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Request a Blood',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: const Color(0xff81201a),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Icon(
          Icons.bloodtype_outlined,
          size: screenWidth * 0.1,
          color: const Color(0xff81201a),
        ),
      ],
    );
  }
}
