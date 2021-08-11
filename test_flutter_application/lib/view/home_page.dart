import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/bloc/user_bloc.dart';
import 'package:test_flutter_application/bloc/user_state.dart';
import 'package:test_flutter_application/services/user_repository.dart';
import 'package:test_flutter_application/view/user_info.dart';
import 'package:test_flutter_application/widgets/action_buttons.dart';
import 'package:test_flutter_application/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
