import 'package:flutter/material.dart';

class ChatbotText extends StatelessWidget {
  const ChatbotText({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double paddingValue = MediaQuery.of(context).size.width > 600 ? 20 : 15;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.android,
              color: Color(0xff81201a),
              size: 45,
            ),
            const SizedBox(width: 10),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 225,
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color(0xfff0f0f0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.all(paddingValue),
                child: const Text(
                  'How can I assist you?',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
