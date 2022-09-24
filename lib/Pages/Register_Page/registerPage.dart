import 'package:flutter/material.dart';
import 'registerForm.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        margin: const EdgeInsets.only(top: 20),
        child: RegisterForm(),
      ),
    );
  }
}