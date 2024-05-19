import 'package:cloud_firestore/cloud_firestore.dart';

class SelectTimeRequestModel {
  final DateTime day;
  final int hourSlot;
  final String email;
  final String phone;
  final String id;
  final int bloodBracketCount;
  final int bloodBracket;
  final String recipientId;

  SelectTimeRequestModel({
    required this.recipientId,
    required this.bloodBracket,
    this.bloodBracketCount=0,
    required this.id,
    required this.day,
    required this.hourSlot,
    required this.email,
    required this.phone,
  });
  factory SelectTimeRequestModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SelectTimeRequestModel(
      recipientId: data['recipientId'],
      bloodBracket: data['bloodBracket'],
      id: doc.id,
      bloodBracketCount: data['bloodBracketCount'],
      day: (data['day'] as Timestamp).toDate(),
      hourSlot: data['hourSlot'],
      email: data['email'],
      phone: data['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipientId': recipientId,
      'bloodBracket': bloodBracket,
      'id': id,
      "bloodBracketCount": bloodBracketCount,
      'day': day,
      'hourSlot': hourSlot,
      'email': email,
      'phone': phone,
    };
  }
}
