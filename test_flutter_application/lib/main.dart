import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/services/auth.dart';
import 'package:test_flutter_application/view/splash_page.dart';

import 'bloc/client_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientBloc>(
        create: (context) => ClientBloc(AuthService()),
        child: MaterialApp(home: SplashPage()));
  }
}
