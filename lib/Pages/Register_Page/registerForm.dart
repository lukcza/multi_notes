import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Widgets/button.dart';
import '../../main.dart';
import '../Login_Page/loginPage.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "email",
                    icon: Icon(Icons.email_outlined)
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height:10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: passwordController2,
                decoration: const InputDecoration(
                  hintText: "repeat password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height:10,),
              MyButton(
                width: 200,
                height: 50,
                onPressed: () {
                    signUp();
                  },
                text: Text('Register'),
                icon: Icon(Icons.arrow_forward),
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
                    MaterialPageRoute(
                        builder: (context)=> const LoginPage()
                    ),
                  );
                },
                text: Text('I have an account'),
                icon: Icon(Icons.arrow_back),
              ),
            ],
          ),
        )
    );
  }
  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}