import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;


  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,

  });

  Map <String,dynamic> toMap(){
    return {
      'senderID' : senderID,
      'senderEmail' : senderEmail,
      'receiverID' : receiverID,
      'message' : message,
      'timestamp' : timestamp,
    };
  }

//   Message copyWith ({
//     String? senderID,String? senderEmail, String? receiverID, String? message,Timestamp? timestamp,String? status
// }){
//     return Message(
//       senderID: senderID ?? this.senderID,
//       senderEmail: senderEmail ?? this.senderEmail,
//       receiverID: receiverID ?? this.receiverID,
//       message: message ?? this.message,
//       timestamp: timestamp ?? this.timestamp,
//       status: status ?? this.status
//     );
//   }
}