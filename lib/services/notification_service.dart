import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../models/users/user_model.dart';

class NotificationService {

  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  static User get user => FirebaseAuth.instance.currentUser!;

  static UserModel me = UserModel(
    uid: FirebaseAuth.instance.currentUser!.uid, 
    password: '',
    photoUrl: '', 
    location: '', 
    bloodType: '', 
    token: '',
    email: '',
    name: '',
  );

  static Future <void> getFirebaseMessagingToken() async{
    await fMessaging.requestPermission();
    await fMessaging.getToken().then((t){
      if(t != null){
        me.token = t;
        debugPrint("push token: $t");
      }
    });
  }
}