import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_notes/Pages/Home_Page/homePage.dart';
import 'package:multi_notes/Pages/Login_Page/loginPage.dart';
import '../Login_Page/loginPage.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream:  FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const HomePage();
        }else {
          return const LoginPage();
        }
      },
    ),
  );
}
