import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multi_notes/Pages/Your_Note_Page/yourNotePage.dart';

import '../Add_Note_Page/addNotePage.dart';

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
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                title: Text("UserName"),
                onTap: () => showProfile(),
              ),
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
                  }))
                },
              ),
            ],
          )),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.amber,
              ),

              child: GestureDetector(
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const YourNotePage();
                  }))
                },
                child: Center(
                  child: Text("YOUR NOTE"),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: GestureDetector(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddNotePage();
                }))
              },
              child: Center(
                child: Text("ADD NOTE"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future showProfile() async {
    showDialog(
        context: context,
        builder: (context) => Card(
              color: Colors.amber,
              child: Column(
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ));
  }
}
