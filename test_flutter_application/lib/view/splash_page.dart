import 'package:flutter/material.dart';
import 'package:test_flutter_application/view/authorization_page.dart';
import 'package:test_flutter_application/view/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
