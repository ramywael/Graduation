import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  User? getCurrentUser (){
    return FirebaseAuth.instance.currentUser;
  }
}