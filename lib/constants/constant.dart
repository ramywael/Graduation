import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

const Color kPrimaryColor = Color(0xFF811F1A);
const Color kSecondaryColor = Color(0xFF286E34);
final List<BoxShadow> kBoxShadow = [
  BoxShadow(
    color: Colors.grey[200]!,
    offset: const Offset(1, 3),
    blurRadius: 6,
    spreadRadius: 3,
  )
];
String kBloodRequestCollectionName="BloodRequests";
String kUserCollectionName = "users";

List<String> bloodGroups = [
  "A+",
  "A-",
  "B+",
  "B-",
  "AB+",
  "AB-",
  "O+",
  "O-",
];

enum UrgencyLevel {
  Normal,
  High,
  Critical,
}

List<int> hoursOfWork = [
  8,
  10,
  12,
  14,
  16,
  18,
  20,
];

String? validatePassword(String value) {
  if (value.isEmpty) {
    return "Password must not be empty";
  }

  // Check for minimum length
  if (value.length < 8) {
    return "Password must be at least 8 characters long";
  }

  // Check for uppercase letters
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return "Password must contain at least one uppercase letter";
  }

  // Check for lowercase letters
  if (!value.contains(RegExp(r'[a-z]'))) {
    return "Password must contain at least one lowercase letter";
  }

  // Check for numbers
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Password must contain at least one number";
  }

  // Check for special characters
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return "Password must contain at least one special character";
  }
  return null;
}

void showScaffoldMessenger(
    {required BuildContext context,
    required String message,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}

hasConnection(context) async {
  bool isOnline = await InternetConnectionChecker().hasConnection;
  if (isOnline == false) {
    showScaffoldMessenger(
        context: context,
        message: "No Internet Connection",
        color: Colors.yellow[400]!
      ,);
  }
}
