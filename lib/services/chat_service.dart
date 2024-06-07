import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/models/message/message.dart';

class ChatService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;


  //get user stream
  // Stream<List<Map<String,dynamic>>> getUsersStream (){
  //   return firestore
  //       .collection(kUserCollectionName)
  //       .snapshots()
  //       .map((snapshot) {
  //         return snapshot.docs.map((doc) {
  //           final user = doc.data();
  //           return user;
  //         }).toList();
  //       });
  // }

  // send message

  Future<void> sendMessage (String receiverID,message) async{
    final String currentUserID = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email!;
    final timestamp = Timestamp.now();

    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    //chat room ID for 2 users
    List <String> ids =[currentUserID,receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // add new message to firebase
    await firestore
        .collection(kChatRoom)
        .doc(chatRoomID)
        .collection(kMessages)
        .add(newMessage.toMap()
    );
  }


  //get messages
  Stream <QuerySnapshot> getMessages (String userID, otherUserID){
    List <String> ids = [userID,otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return firestore
        .collection(kChatRoom)
        .doc(chatRoomID)
        .collection(kMessages)
        .orderBy("timestamp",descending: false)
        .snapshots();
  }



}