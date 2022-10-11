import 'package:flutter/material.dart';

const List<String> list = <String>['Blue', 'Two', 'Three', 'Four'];

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
          children:  [
            TextField(
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Your note...",
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)
              ),
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                  textTheme: ButtonTextTheme.normal,
                  padding: EdgeInsets.all(10),
                  onPressed: ()=>print("added note")
              ),
            )
          ],
        ),
      ),
    );
  }
}
