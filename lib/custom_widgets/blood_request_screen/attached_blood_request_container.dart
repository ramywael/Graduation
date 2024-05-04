import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class AttachedBloodRequestContainer extends StatelessWidget {
  final double screenWidth;
  final Function()? onUpload;
  const AttachedBloodRequestContainer({Key? key, required this.screenWidth, this.onUpload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth * 0.3,
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
            color: kPrimaryColor,
          ),
          const Spacer(flex: 7),
          Container(
            width: screenWidth * 0.26,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
              onPressed: onUpload,
              child: const Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
