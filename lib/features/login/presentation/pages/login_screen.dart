import 'package:flutter/material.dart';
import 'widgets/login_screen_body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginScreenBody(),
      ),
    );
  }
}
