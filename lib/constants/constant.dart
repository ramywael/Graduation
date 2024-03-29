import 'package:flutter/material.dart';

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

List bloodGroups = [
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