import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_notes/Pages/Main_Page/mainPage.dart';
import 'package:multi_notes/Pages/Register_Page/registerPage.dart';
import '../../Widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
              hintText: "email", icon: Icon(Icons.email_outlined)),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: "password",
            icon: Icon(Icons.lock),
          ),
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          width: 200,
          height: 50,
          onPressed: () {
            signIn();
          },
          text: Text('Login'),
          icon: Icon(Icons.check),
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          width: 200,
          height: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const RegisterPage();
              }),
            );
          },
          text: Text('Register'),
          icon: Icon(Icons.arrow_forward),
        ),
      ],
    ));
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
