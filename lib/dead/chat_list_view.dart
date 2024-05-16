import 'package:flutter/material.dart';
import '../custom_widgets/chat/chat_bubble.dart';
class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage('assets/images/onBoarding1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   width: constraints.maxWidth * 0.8,
            //   child: ListView.builder(
            //     itemCount: 15,
            //     itemBuilder: (context, index) {
            //       return const ChatBubble();
            //     },
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
