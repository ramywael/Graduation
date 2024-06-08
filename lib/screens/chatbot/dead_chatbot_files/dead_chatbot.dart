
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant.dart';

class DeadChatbot extends StatefulWidget {
  const DeadChatbot({super.key});

  @override
  State<DeadChatbot> createState() => _DeadChatbotState();
}

class _DeadChatbotState extends State<DeadChatbot> {

  final _user = ChatUser(id: '1', firstName: 'ahmed');
  final _bot = ChatUser(id: '2',firstName: 'Bot');

  List<ChatMessage> messages = [];

  final _chatGpt = OpenAI.instance.build(
    token: 'sk-proj-FKcfMIZ5BfMs4e8JhYvRT3BlbkFJH33FU9lxlfUjx1wBuUbb',
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 10),
    )
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'ChatGPT',
          style: TextStyle(fontSize: 28, fontFamily: 'Ubuntu'),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: DashChat(
        currentUser: _user,
        onSend: onSend,
        messages: messages,
        messageOptions: const MessageOptions(
          currentUserContainerColor: kPrimaryColor
        ),
      ),
    );
  }


  void onSend(ChatMessage message) async {
    try {
      setState(() {
        if (!messages.contains(message)) {
          messages.insert(0, message);
        }
      });

      List<Map<String, dynamic>> messagesHistory = messages.map((message) {
        if (message.user == _user) {
          return {'role': 'user', 'content': message.text};
        } else {
          return {'role': 'assistant', 'content': message.text};
        }
      }).toList();

      var request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: messagesHistory,
        maxToken: 200,
      );

      var response = await _chatGpt.onChatCompletion(request: request);

      for (var element in response!.choices) {
        if (element.message != null) {
          setState(() {
            if (!messages.contains(ChatMessage(
                text: element.message!.content,
                user: _bot,
                createdAt: DateTime.now()))) {
              messages.insert(
                0,
                ChatMessage(
                  text: element.message!.content,
                  user: _bot,
                  createdAt: DateTime.now(),
                ),
              );
            }
          });
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
      showScaffoldMessenger(
          context: context,
          message: e.toString(),
          color: kPrimaryColor)
      ;
    }
  }
}

