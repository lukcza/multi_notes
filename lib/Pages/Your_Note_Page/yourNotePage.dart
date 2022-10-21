import 'package:flutter/material.dart';
import 'package:multi_notes/Pages/Your_Note_Page/YourNotePageContent.dart';

class YourNotePage extends StatelessWidget {
  const YourNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:YourNoteContent(),
    );
  }
}
