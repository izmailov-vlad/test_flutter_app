import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter_application/models/client.dart';

class ClientProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Client?> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return Client.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<Client?> registerInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return Client.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _auth.signOut();
  }

  Stream<Client?> get currentUser {
    return _auth.onAuthStateChanged.map(
        (FirebaseUser user) => user != null ? Client.fromFirebase(user) : null);
  }
}
