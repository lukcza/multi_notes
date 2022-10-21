import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Blue', 'Red', 'Black', 'White'];

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  late final userID = FirebaseAuth.instance.currentUser?.uid.toString();
  String dropdownValue = list.first;
  void dispose() {
    this.titleController;
    super.dispose();
  }
    Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 70, 10, 10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              controller: titleController,
            ),
            const SizedBox(height: 20),
             TextField(
              decoration: const InputDecoration(
                hintText: "Your note...",
              ),
               controller: noteController,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () => addNote(noteTitle: titleController.text.toString(),noteContent: noteController.text.toString(),noteColor: dropdownValue, authorID: userID),
        child: Icon(Icons.add),
      ),
    );
  }
  Future addNote({required String noteTitle,required String noteContent, required String noteColor, required String? authorID })async{
      final note = FirebaseFirestore.instance.collection('Note');
      final json ={
        'AuthorID': authorID,
        'Color' : noteColor,
        'Note': noteContent,
        'Title': noteTitle,
      };
      await note.add(json);
      //await note.set(json);
  }
}
