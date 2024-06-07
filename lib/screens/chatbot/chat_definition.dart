import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/chatbot/suggetion_box.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'chatbot_view.dart';

class ChatbotHomeView extends StatefulWidget {
  static const String routeName = 'home';
  const ChatbotHomeView({super.key});

  @override
  State<ChatbotHomeView> createState() => _ChatbotHomeViewState();
}

class _ChatbotHomeViewState extends State<ChatbotHomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.white,
            kPrimaryColor,
            kPrimaryColor,
          ], // Set your gradient colors here
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const HomePage();
                }));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white70,
                size: 30,
              ),
            ),
          ),
          title: const Text(
            "ChatGPT",
            style: TextStyle(
                fontFamily: "Pacifico",
                color: Colors.white70,
                letterSpacing: 3,
                fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/bot.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: AnimatedTextKit(
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hello, What can I do for you?",
                          speed: const Duration(milliseconds: 50),
                          textStyle: const TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 26,
                              color: Colors.white),
                        )
                      ]),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Here are some features",
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SuggetionBox(
                    header: "Ask For Information",
                    body: "feel free to ask whatever goes in your mind",
                    color: Colors.deepOrange),
                const SuggetionBox(
                    header: "Powerful AI",
                    body:
                    "giving facts and up-to-date information with a trained ai bot",
                    color: Colors.deepPurple),
                const SuggetionBox(
                    header: "Fast and Accurate",
                    body:
                    "Our model is trained to be as fast and accurate as possible",
                    color: kPrimaryColor),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatbotView();
              }));
            },
            elevation: 15,
            backgroundColor: Colors.white70,
            tooltip: "Chat with chatGPT",
            child: Image.asset(
              "assets/images/gpt.png",
              width: 33,
            )),
      ),
    );
  }
}