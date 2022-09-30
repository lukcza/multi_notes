import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:multi_notes/Pages/Main_Page/mainPage.dart';

import 'Pages/Login_Page/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

