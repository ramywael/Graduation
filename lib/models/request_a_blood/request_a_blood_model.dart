import 'package:cloud_firestore/cloud_firestore.dart';

class RequestBloodModel {
  final String bloodNeeded;
  final String urgencyLevel;
  final int brackets;
  final String medicalImage;
  final DateTime date;
  final bool isAccepted;
  final String id;
  final String uid;

  RequestBloodModel({
    required this.uid,
    this.isAccepted = false,
    required this.bloodNeeded,
    required this.id,
    required this.urgencyLevel,
    required this.brackets,
    required this.medicalImage,
    required this.date,
  });

  factory RequestBloodModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RequestBloodModel(
      uid: data["uid"],
      id: data["BloodRequestId"],
      bloodNeeded: data['BloodNeeded'],
      urgencyLevel: data['UrgencyLevel'],
      brackets: data['Brackets'],
      medicalImage: data['MedicalImage'],
      date: (data['Date'] as Timestamp).toDate(),
      isAccepted: data['IsAccepted'],
    );
  }

  toJson() {
    return {
      "uid": uid,
      "BloodRequestId": id,
      'BloodNeeded': bloodNeeded,
      'UrgencyLevel': urgencyLevel,
      'Brackets': brackets,
      'MedicalImage': medicalImage,
      'Date': date,
      'IsAccepted': isAccepted,
    };
  }
}
