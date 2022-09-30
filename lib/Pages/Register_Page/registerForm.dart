import 'package:flutter/material.dart';
import '../../Widgets/button.dart';
import '../Login_Page/loginPage.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

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
                controller: _emailController,
                decoration: const InputDecoration(
                    hintText: "email",
                    icon: Icon(Icons.email_outlined)
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height:10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: _passwordController2,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> const LoginPage()
                    ),
                  );
                },
                text: Text('Register'),
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        )
    );
  }
}