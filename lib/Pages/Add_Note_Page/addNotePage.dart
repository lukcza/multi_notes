import 'package:flutter/material.dart';
import 'addNoteForm.dart';
class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AddNoteForm(),
    );
  }
}
