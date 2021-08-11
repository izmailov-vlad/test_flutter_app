import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_application/view/authorization_page.dart';
import 'package:test_flutter_application/view/home_page.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Future getCurrentUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    print("User: ${_user.displayName ?? "None"}");
    return _user;
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: getCurrentUser() == null ? AuthorizationPage() : HomePage()
    );
  }
}
 