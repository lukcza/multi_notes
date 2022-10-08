import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multi_notes/Pages/Add_Note_Page/addNotePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          width: 170,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
              ListTile(
                leading: Icon(Icons.note_add),
                title: Text("Add note"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const AddNotePage();
                      }
                    )
                  )
                },
              ),
            ],
          )),
      body: const Center(child: Text("Hello USER")),
    );
  }
}
