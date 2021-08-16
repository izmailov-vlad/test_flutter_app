import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_application/bloc/client_bloc.dart';
import 'package:test_flutter_application/bloc/client_state.dart';
import 'package:test_flutter_application/bloc/user_bloc.dart';
import 'package:test_flutter_application/models/client.dart';
import 'package:test_flutter_application/view/authorization_page.dart';
import 'package:test_flutter_application/view/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(builder: (context, state) {
      return state == ClientNotAuthorizedState()
          ? HomePage()
          : AuthorizationPage();
    });
  }
}
