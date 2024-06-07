import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart%20'as fd;
import 'package:flutter/material.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:grad/constants/constant.dart';

import 'package:grad/services/firebase_provider.dart';
import 'package:grad/services/notification_service.dart';
// import 'package:timeago/timeago.dart' as timeago;

import '../../custom_widgets/chat/chat_bubble.dart';
import '../../services/auth_service.dart';
import '../../services/chat_service.dart';

class ChatView extends StatefulWidget {
   const ChatView(
      {Key? key,
      required this.receiverEmail,
      required this.receiverID,
      required this.receiverName,})
      : super(key: key);

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
  fd.FirebaseDatabase database = fd.FirebaseDatabase.instance;


  @override
  void initState() {
    super.initState();
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          Future.delayed(
            const Duration(milliseconds: 500),
                () => scrollDown(),
          );
        }
      });
      Future.delayed(const Duration(milliseconds: 500), () =>scrollDown());

      firebaseProvider.configurePresence();
      subscription = FGBGEvents.stream.listen((event) {
      if (event == FGBGType.foreground) {
        firebaseProvider.connect();
      } else if (event == FGBGType.background) {
        firebaseProvider.disconnect();
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    messageController.dispose();
    super.dispose();
  }
  final firebaseProvider = FirebaseProvider();
  StreamSubscription<FGBGType>? subscription;
  // var state = Message.onlineStatus;

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
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.02), // 2% of screen width
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: screenWidth * 0.045, // 3% of screen width
                      color: const Color(0xff717171),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.035,
            ),
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
                // Text.rich(
                //   TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'Donor Status: ',
                //         style: TextStyle(
                //           fontFamily: 'Roboto',
                //           fontSize: screenWidth * 0.035, // 3% of screen width
                //         ),
                //       ),
                //       TextSpan(
                //         // text: state?.status ?? '',
                //         text: "Active now",
                //         style: TextStyle(
                //           fontFamily: 'Roboto',
                //           fontSize: screenWidth * 0.035, // 3% of screen width
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
              buildUserInput(screenWidth, screenHeight),
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



//---------------------------------------------------------------------
  void sendMessage() async {

    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(widget.receiverID,messageController.text);

      messageController.clear();
    }
    scrollDown();
  }

  Widget buildMessageList() {
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(widget.receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  const Center(
            child: SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          );
        }
        return ListView(
          controller: scrollController,
          children: snapshot.data!.docs
              .map((doc) => buildMessageItem(doc, context))
              .toList(),
        );
      },
    );
  }

  Widget buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;
    return Container(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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

  Widget buildUserInput(screenWidth, screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.01,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      screenHeight * 0.025), // 4.5% of screen height
                  topRight: Radius.circular(
                      screenHeight * 0.025), // 4.5% of screen height
                  bottomRight: Radius.circular(
                      screenHeight * 0.025), // 4.5% of screen height
                  bottomLeft: Radius.circular(screenHeight * 0.025),
                ),
              ),
              margin: const EdgeInsets.all(10),
              height: screenHeight * 0.08,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  onTap: (){
                     Future.delayed(const Duration(milliseconds: 500), () =>scrollDown());
                  },
                  focusNode:focusNode,
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
                      )),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 7, right: 15),
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
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

  void scrollDown() {
    try{

      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    }catch (e){
      debugPrint(e.toString());

    }
  }

  // Future<void> getUserPresenceStatus(String friendId) async {
  //   final myConnectionRef =
  //       database.ref().child('presence').child(friendId).child('connections');
  //
  //   final friendConnectionUser = await myConnectionRef.get();
  //
  //   if(friendConnectionUser.exists){
  //     state = state?.copyWith(status: 'online');
  //   }else{
  //     getUserLastSeen(friendId);
  //   }
  //
  //   myConnectionRef.onValue.listen((event) {
  //     if(event.snapshot.exists){
  //       state = state?.copyWith(status: 'online');
  //     }else{
  //       getUserLastSeen(friendId);
  //     }
  //   });
  // }
  //
  // Future<void> getUserLastSeen(String friendId) async{
  //   final lastOnlineRef =
  //   database.ref().child('presence').child(friendId).child('lastOnline');
  //
  //   final friendLastOnlineUser = await lastOnlineRef.get();
  //   if(friendLastOnlineUser.exists){
  //
  //     Map map = friendLastOnlineUser.value as Map<dynamic, dynamic>;
  //
  //     if(map.containsKey('lastOnline')){
  //
  //       var date = DateTime.fromMillisecondsSinceEpoch(map['lastOnline']).toLocal();
  //
  //       String dateTime = timeago.format(date);
  //       print(dateTime);
  //
  //       state = state?.copyWith(status: dateTime);
  //
  //     }else{
  //       state = state?.copyWith(status: '');
  //     }
  //   }
  // }



}
