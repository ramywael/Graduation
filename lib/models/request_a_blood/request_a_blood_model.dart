class RequestBloodModel {
  final String bloodNeeded;
  final String urgencyLevel;
  final int brackets;
  final String medicalImage;
  final DateTime date;
  final bool isAccepted;

  RequestBloodModel({
    this.isAccepted = false,
    required this.bloodNeeded,
    required this.urgencyLevel,
    required this.brackets,
    required this.medicalImage,
    required this.date,
  });
  toJson() {
    return {
      'BloodNeeded': bloodNeeded,
      'UrgencyLevel': urgencyLevel,
      'Brackets': brackets,
      'MedicalImage': medicalImage,
      'Date': date,
      'IsAccepted': isAccepted,
    };
  }
}
