import 'package:flutter/material.dart';

class BottomBarRow extends StatelessWidget {
  const BottomBarRow({super.key,});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: const Offset(1, 3),
                  blurRadius: 6,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Type your message ...',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xff8d8d8d),
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 3,),
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xffbcb0b0)
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.send,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
