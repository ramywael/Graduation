class RequestBloodModel {
  final String bloodNeeded;
  final String urgencyLevel;
  final int backets;
  final String medicalImage;
  final DateTime date;

  RequestBloodModel(
    this.bloodNeeded,
    this.urgencyLevel,
    this.backets,
    this.medicalImage,
    this.date,
  );
}
