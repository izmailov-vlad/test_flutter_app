import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_application/models/client.dart';
import 'package:test_flutter_application/services/auth.dart';
import 'package:test_flutter_application/view/splash_page.dart';

void main() {
  runApp(StreamProvider<Client?>.value(
    value: AuthService().currentUser,
    initialData: null,
    child: MaterialApp(home: SplashPage()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
