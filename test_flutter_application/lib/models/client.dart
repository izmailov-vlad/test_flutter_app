import 'package:firebase_auth/firebase_auth.dart';

class Client {
  late String id;

  Client.fromFirebase(FirebaseUser user) {
    id = user.uid;
  }
}
