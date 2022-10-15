import 'package:flutter/material.dart';

const List<String> list = <String>['Blue', 'Red', 'Black', 'White'];

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  String dropdownValue = list.first;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 70, 10, 10),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: "Your note...",
              ),
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
        onPressed: () {()=>print("added note"); },
        child: Icon(Icons.add),
      ),
    );
  }
}
