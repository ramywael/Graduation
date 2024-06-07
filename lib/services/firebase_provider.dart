import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart%20';


class FirebaseProvider {
  StreamSubscription? subscription;
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> configurePresence() async {
    String myUserId = FirebaseAuth.instance.currentUser!.uid;

    DatabaseReference con;
    final myConnectionRef =
        database.ref().child('presence').child(myUserId).child('connections');

    final lastOnlineRef =
        database.ref().child('presence').child(myUserId).child('lastOnline');

    await database.goOnline();

    // database.ref().child('presence').child(myUserId).onValue.listen((event) { });

    subscription = database.ref().child('.info/connected').onValue.listen((event) {
      if(event.snapshot.value != null){
        con = myConnectionRef.push();
        con.onDisconnect().remove();
        con.set(true);

        lastOnlineRef.onDisconnect().set(ServerValue.timestamp);
      }
    });

  }

  void connect(){
    configurePresence();
  }

  disconnect(){
    subscription?.cancel();
    database.goOffline();
  }

}
