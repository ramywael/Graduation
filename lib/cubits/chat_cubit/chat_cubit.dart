// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart'as fd;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grad/cubits/chat_cubit/chat_states.dart';
// import 'package:flutter/material.dart';
//
// import '../../constants/constant.dart';
// import '../../custom_widgets/chat/chat_bubble.dart';
// import '../../services/auth_service.dart';
// import '../../services/chat_service.dart';
//
// class ChatCubit extends Cubit<ChatStates>{
//   ChatCubit() : super (ChatInitialState());
//
//
//
//
//   Widget buildMessageList() {
//     String senderID = authService.getCurrentUser()!.uid;
//     emit(BuildMessageListState());
//     return StreamBuilder(
//       stream: chatService.getMessages(receiverID!, senderID),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           emit(ErrorState());
//           return const Text("Error");
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           emit(WaitingState());
//           return  const Center(
//             child: SizedBox(
//               width: 35,
//               height: 35,
//               child: CircularProgressIndicator(
//                 strokeWidth: 3,
//               ),
//             ),
//           );
//         }
//         else{
//           emit(ShowListViewState());
//           return ListView(
//             controller: ChatCubit.get(context).scrollController,
//             children: snapshot.data!.docs
//                 .map((doc) => buildMessageItem(doc, context))
//                 .toList(),
//           );
//         }
//       },
//     );
//   }
//
//
//   Widget buildMessageItem(DocumentSnapshot doc, BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;
//     emit(BuildMessageItemState());
//     return Container(
//       alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Column(
//         crossAxisAlignment:
//         isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           // Text(data[kMessages]),
//           ChatBubble(
//             message: data['message'],
//             isCurrentUser: isCurrentUser,
//             bottomRightBorderRadius: isCurrentUser ? 0 : screenWidth * 0.06,
//             bottomLeftBorderRadius: isCurrentUser ? screenWidth * 0.06 : 0,
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget buildUserInput(screenWidth, screenHeight) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: screenWidth * 0.01,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               alignment: Alignment.centerLeft,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(
//                       screenHeight * 0.025), // 4.5% of screen height
//                   topRight: Radius.circular(
//                       screenHeight * 0.025), // 4.5% of screen height
//                   bottomRight: Radius.circular(
//                       screenHeight * 0.025), // 4.5% of screen height
//                   bottomLeft: Radius.circular(screenHeight * 0.025),
//                 ),
//               ),
//               margin: const EdgeInsets.all(10),
//               height: screenHeight * 0.08,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: TextFormField(
//                   focusNode: focusNode,
//                   controller: messageController,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       hintText: 'Type your message ...',
//                       hintStyle: TextStyle(
//                         fontSize: 17,
//                         color: Color(0xff8d8d8d),
//                         fontFamily: 'Roboto',
//                       )),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 7, right: 15),
//             height: 55,
//             width: 55,
//             decoration: const BoxDecoration(
//               color: kPrimaryColor,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               onPressed: sendMessage,
//               icon: const Icon(
//                 Icons.arrow_upward,
//                 size: 25,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//   void scrollDown() {
//    try{
//
//      scrollController.animateTo(scrollController.position.maxScrollExtent,
//          duration: const Duration(milliseconds: 500),
//          curve: Curves.fastOutSlowIn);
//
//    }catch (e){
//      debugPrint(e.toString());
//
//    }
//   }
//
//
// }