import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          height: 50,
          child: SignInButton(
            Buttons.Google,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            text: 'Entrar com o google',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
