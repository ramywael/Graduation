
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
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
      child: GestureDetector(
        onTap: (){},
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Container(
            height: 16,
            width: 16,
            decoration: const BoxDecoration(
              color: Color(0xff81201a),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
