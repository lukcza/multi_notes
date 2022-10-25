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
   late final userName = FirebaseAuth.instance.currentUser?.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          width: 150,
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                title: Text("${userName}"),
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
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const YourNotePage();
                  }))
                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                  ),
                  child: Center(
                    child: Text("YOUR NOTE",style: TextStyle(fontSize:30),),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddNotePage();
                  }))
                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black38,
                  ),
                  child: Center(
                    child: Text("ADD NOTE",style: TextStyle(fontSize:30),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const AddNotePage();
        }))
      ),
    );
  }

  Future showProfile() async {
    showDialog(
      barrierLabel: "Porifle",
        context: context,
        builder: (context) => SafeArea(
          child: Card(
                color: Colors.black12,
                child: Column(
                  children:[
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                          "Email: ${userName}",style: TextStyle(fontSize: 15),
                      ),
                    ),

                  ],
                ),
          ),
        ));
  }
}
