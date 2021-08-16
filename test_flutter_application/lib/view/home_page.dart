import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/bloc/user_bloc.dart';
import 'package:test_flutter_application/services/auth.dart';
import 'package:test_flutter_application/services/user_repository.dart';
import 'package:test_flutter_application/view/authorization_page.dart';
import 'package:test_flutter_application/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final userRepository = UserRepository();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    _authService.logOut();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AuthorizationPage()));
                  },
                  icon: Icon(Icons.logout))
            ],
            title: Text("Users List"),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Expanded(child: UserList())],
          )),
    );
  }
}
