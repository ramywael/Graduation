import 'package:flutter/material.dart';

class BloodRequestContent extends StatelessWidget {
  const BloodRequestContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Blood',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          height: screenWidth * 0.2,
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
            children: [
              const Spacer(flex: 1),
              Text(
                '3',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: screenWidth * 0.06,
                  fontFamily: 'Roboto-Regular',
                  color: Colors.black,
                ),
              ),
              const Spacer(flex: 7),
              Text(
                'Urgent Request',
                style: TextStyle(
                  fontSize: screenWidth * 0.018,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        const Text(
          'Attached',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          height: screenWidth * 0.24,
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
            children: [
              const Spacer(flex: 2),
              const Icon(
                Icons.download,
                size: 50,
                color: Color(0xff81201a),
              ),
              const Spacer(flex: 7),
              Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.06,
                decoration: BoxDecoration(
                  color: const Color(0xff81201a),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Download',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          height: screenWidth * 0.18,
          width: double.infinity,
          alignment: Alignment.centerLeft,
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
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.1),
            child: Text(
              '10/15/2022',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: screenWidth * 0.04,
                fontFamily: 'Roboto-Regular',
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.055),
        Center(
          child: Container(
            width: screenWidth * 0.4,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: const Color(0xff81201a),
              borderRadius: BorderRadius.circular(45),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

