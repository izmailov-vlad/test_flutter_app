import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_application/view/authorization_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/home_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthorizationPage(),
    );
  }
}
