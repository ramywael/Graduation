import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import '../../custom_widgets/chat/chat_list_view.dart';
import '../../custom_widgets/chatbot/bottom_app_bar.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffbcb0b0),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: screenHeight * 0.095, // 10% of screen height
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: screenHeight * 0.06, // 6% of screen height
              width: screenHeight * 0.06, // 6% of screen height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: kBoxShadow,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.02), // 2% of screen width
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: screenWidth * 0.045, // 3% of screen width
                      color: const Color(0xff717171),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.035,),
            CircleAvatar(
              radius: screenHeight * 0.035, // 4% of screen height
              backgroundImage: const AssetImage('assets/images/profile_image.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: screenWidth * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: screenWidth * 0.05, // 5% of screen width
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Donor Status: ',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: screenWidth * 0.035, // 3% of screen width
                        ),
                      ),
                      TextSpan(
                        text: 'Active',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: screenWidth * 0.035, // 3% of screen width
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: const ChatListView(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.075), // 1% and 5% of screen width
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
            topRight: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
            bottomRight: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
            bottomLeft: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
          ),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.white,
            height: screenHeight * 0.09, // 9% of screen height
            child: const BottomBarRow(),
          ),
        ),
      ),
    );
  }
}


