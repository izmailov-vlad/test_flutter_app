import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:test_flutter_application/services/auth.dart';
import 'package:test_flutter_application/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter_application/view/registration_page.dart';

class AuthorizationPage extends StatelessWidget {
  AuthService _authService = AuthService();
  AuthorizationPage({Key? key}) : super(key: key);

  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new TextFormField(
                decoration: new InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                style: _sizeTextBlack,
              ),
              width: 400.0,
            ),
            new Container(
              child:  new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                obscureText: true,
                style: _sizeTextBlack,
              ),
              width: 400.0,
              padding: new EdgeInsets.only(top: 10.0),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 25.0),
              child: new MaterialButton(
                color: Theme.of(context).accentColor,
                height: 50.0,
                minWidth: 150.0,
                onPressed: () {
                  _loginButtonPressed()
                },
                child: new Text(
                  "LOGIN",
                  style: _sizeTextWhite,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 25.0),
              child: new MaterialButton(
                height: 50.0,
                minWidth: 150.0,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationPage()));
                },
                child: new Text(
                  "Not registered yet? Register!",
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
