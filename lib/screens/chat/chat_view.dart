import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/chat/chat_bubble.dart';
import 'package:grad/services/auth_service.dart';
import 'package:grad/services/chat_service.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key,
    required this.receiverEmail,
    required this.receiverID,
    required this.receiverName}) : super(key: key);

  final String receiverEmail;
  final String receiverID;
  final String receiverName;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    //add listener to focus node
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        Future.delayed(
            const Duration(milliseconds: 500)
            ,()=> scrollDown(),
        );
      }
    });
    Future.delayed(
        const Duration(milliseconds: 500),
            ()=> scrollDown()
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    messageController.dispose();
    super.dispose();
  }

  void scrollDown (){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn
    );
  }

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
        automaticallyImplyLeading: false,
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
            // CircleAvatar(
            //   radius: screenHeight * 0.035, // 4% of screen height
            //   backgroundImage: const AssetImage('assets/images/profile_image.png'),
            //   backgroundColor: Colors.transparent,
            // ),
            SizedBox(width: screenWidth * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.receiverName,
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
      // body: const ChatListView(),
      body: Stack(
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
          Column(
            children: [
              //display all messages
              Expanded(
                child: buildMessageList(),
              ),
              buildUserInput(screenWidth,screenHeight),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.075), // 1% and 5% of screen width
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
      //       topRight: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
      //       bottomRight: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
      //       bottomLeft: Radius.circular(screenHeight * 0.045), // 4.5% of screen height
      //     ),
      //     child: BottomAppBar(
      //       elevation: 0,
      //       color: Colors.white,
      //       height: screenHeight * 0.09, // 9% of screen height
      //       child: const BottomBarRow(),
      //     ),
      //   ),
      // ),
    );
  }

  //----------------------------------------------------------------------
  void sendMessage ()async{
    if(messageController.text.isNotEmpty){
      await chatService.sendMessage(widget.receiverID, messageController.text);

      messageController.clear();
    }
    scrollDown();
  }

  Widget buildMessageList (){
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatService.getMessages(widget.receiverID, senderID),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text("Error");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text("Loading ....");
          }
          return ListView(
            controller: scrollController,
            children: snapshot.data!.docs.map((doc) => buildMessageItem(doc,context)).toList(),
          );
        },
    );
  }

  Widget buildMessageItem (DocumentSnapshot doc,BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;
    return Container(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Text(data[kMessages]),
          ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
            bottomRightBorderRadius: isCurrentUser ? 0 : screenWidth * 0.06,
            bottomLeftBorderRadius: isCurrentUser ? screenWidth * 0.06 : 0,
          ),
        ],
      ),
    );
  }

  Widget buildUserInput (screenWidth, screenHeight){
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.01,),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenHeight * 0.025), // 4.5% of screen height
                  topRight: Radius.circular(screenHeight * 0.025), // 4.5% of screen height
                  bottomRight: Radius.circular(screenHeight * 0.025), // 4.5% of screen height
                  bottomLeft: Radius.circular(screenHeight * 0.025),
                ),
              ),
              margin: const EdgeInsets.all(10),
              height: screenHeight * 0.08,
              child:  Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  focusNode: focusNode,
                  controller: messageController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Type your message ...',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Color(0xff8d8d8d),
                        fontFamily: 'Roboto',
                      )
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 7,right: 15),
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child:IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}


