import 'package:flutter/material.dart';

class BottomBarRow extends StatelessWidget {
  const BottomBarRow({super.key,});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Type your message ...',
                    hintStyle: TextStyle(
                      fontSize: 19,
                      color: Color(0xff8d8d8d),
                      fontFamily: 'Roboto',
                    )
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.send,
            size: 25,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
