import 'package:flutter/material.dart';
import 'package:multi_notes/Pages/Main_Page/mainPage.dart';
import 'package:multi_notes/Pages/Register_Page/registerPage.dart';
import '../../Widgets/button.dart';
 class LoginForm extends StatefulWidget {
   const LoginForm({Key? key}) : super(key: key);

   @override
   State<LoginForm> createState() => _LoginFormState();
 }

 class _LoginFormState extends State<LoginForm> {
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Container(
       child:Column(
         children: [
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
             keyboardType: TextInputType.emailAddress,
           ),
           const SizedBox(height:10,),
           MyButton(
             width: 200,
             height: 50,
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) {
                       return MainPage();
                     }
                 ),
               );
             },
             text: Text('Login'),
             icon: Icon(Icons.check),
           ),
           const SizedBox(height: 10,),
           MyButton(
             width: 200,
             height: 50,
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) {
                       return const RegisterPage();
                     }
                 ),
               );
             },
             text: Text('Register'),
             icon: Icon(Icons.arrow_forward),
           ),
         ],
       )
     );
   }
 }
