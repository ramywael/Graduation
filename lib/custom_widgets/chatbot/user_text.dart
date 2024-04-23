import 'package:flutter/material.dart';

class UserText extends StatelessWidget {
  const UserText({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double paddingValue = MediaQuery.of(context).size.width > 600 ? 20 : 15;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 225,
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color(0xff81201a),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.all(paddingValue),
                child: const Text(
                  'I need to request blood donation.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              height: MediaQuery.of(context).size.width > 600 ? 60 : 40,
              width: MediaQuery.of(context).size.width > 600 ? 60 : 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/chat_photo.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

