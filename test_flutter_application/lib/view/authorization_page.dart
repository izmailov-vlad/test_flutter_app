import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:test_flutter_application/models/client.dart';
import 'package:test_flutter_application/services/auth.dart';
import 'package:test_flutter_application/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter_application/view/registration_page.dart';
import 'package:toast/toast.dart';

class AuthorizationPage extends StatelessWidget {
  AuthService _authService = AuthService();
  AuthorizationPage({Key? key}) : super(key: key);

  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;

  Duration get loginTime => Duration(milliseconds: 2250);

  void _onRegisterPressed(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegistrationPage()));
  }

  Widget _button(String text, void func()) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 20, color: Colors.black),
      ),
      onPressed: () {
        func();
      },
      child: Text(text),
    );
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Container(
        child: Align(
          child: Text('Test App',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: new TextFormField(
        controller: controller,
        obscureText: obsecure,
        keyboardType: TextInputType.emailAddress,
        style: _sizeTextWhite,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1)),
          prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              )),
        ),
      ),
      width: 400.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    void _onLoginPressed() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;
      Client? client = await _authService.singInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (client == null) {
        Toast.show("Wrong email or password! Try again", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            backgroundRadius: 20);
      } else {
        _emailController.clear();
        _passwordController.clear();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
    }

    Widget _form(String label, void onLoginPressed()) {
      return Container(
          child: Column(children: [
        Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: _input(Icon(Icons.email), "EMAIL", _emailController, false)),
        Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: _input(
                Icon(Icons.lock), "PASSWORD", _passwordController, true)),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: _button(label, onLoginPressed),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            child: TextButton(
              child: Text(
                'Not registered? Register!',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _onRegisterPressed(context);
              },
            ),
          ),
        )
      ]));
    }

    return new MaterialApp(
      home: new Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: new Column(
            children: <Widget>[
              _logo(),
              _form("LOGIN", _onLoginPressed),
            ],
          )),
    );
  }
}
