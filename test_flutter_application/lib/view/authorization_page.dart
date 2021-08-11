import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_login/theme.dart';
import 'package:test_flutter_application/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthorizationPage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthorizationPage({ Key? key }) : super(key: key);
  
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<Null> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
        auth.createUserWithEmailAndPassword(email: data.name, password: data.password);
        return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return "success";
    });
  }
  @override
  Widget build(BuildContext context) {

    return FlutterLogin(
      title: 'TestApp',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  
  }
}