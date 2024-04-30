class UserModel {
  UserModel({
    this.uid,
    required this.password,
    required this.location,
    required this.bloodType,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  final String? uid;
  final String email;
  final String name;
  final String password;
  final String location;
  final String bloodType;
  final String photoUrl;

  Map<String,dynamic> toJson(){
    return {
      'Email': email,
      'Name': name,
      'PhotoUrl': photoUrl,
      'location': location,
      'BloodType': bloodType,
      'Password': password,
    };
   }
}
