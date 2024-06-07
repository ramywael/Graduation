import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../custom_widgets/chatbot/bottom_app_bar.dart';
import '../../custom_widgets/chatbot/chatbot_text.dart';
import '../../custom_widgets/chatbot/user_text.dart';

class Chatbot extends StatelessWidget {
  final Widget screenName;
  const Chatbot({Key? key, required this.screenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
            color: Color(0xfff0f0f0),
          ),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screenName,));
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xfff0f0f0),
                      radius: 28,
                      child: Icon(
                        Icons.android,
                        color: Color(0xff81201a),
                        size: 50,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xff286e34),
                      radius: 6.0,
                    )
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chatbot',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      'Connect Now',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: SvgPicture.asset(
                    'assets/icons/rocketchatRed_chatBot.svg',
                    height: 30,
                  )
              )
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.4,
                    image: AssetImage(
                      'assets/images/onBoarding1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width > 600 ? 40 : 20,
                  vertical: MediaQuery.of(context).size.width > 600 ? 70 : 35,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ChatbotText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const UserText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const ChatbotText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const UserText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const ChatbotText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const UserText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const ChatbotText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                      const UserText(),
                      SizedBox(height: MediaQuery.of(context).size.width > 600 ? 70 : 35,),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BottomAppBar(
          elevation: 0,
          color: Color(0xfff0f0f0),
          height: 100,
          child: BottomBarRow(),
        ),
      ),
    );
  }
}




