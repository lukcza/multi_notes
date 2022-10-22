import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class NoteBox extends StatelessWidget {

  NoteBox({Key? key, this.padding}) : super(key: key);
  final EdgeInsetsGeometry? padding;
  CollectionReference notes =FirebaseFirestore.instance.collection('Note');
  late final userID = FirebaseAuth.instance.currentUser?.uid.toString();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: notes.where("AuthorID", isEqualTo: userID).get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData)
          {
            Center(child: CircularProgressIndicator(),);
          }
        try {
          if(snapshot.hasError){
            return const Center(child: Text("Something went wrong", style: TextStyle(color: Colors.red,),));
          }
        } on Exception catch (e) {
          print(e);
        }

        if(snapshot.connectionState == ConnectionState.done ){
          return Container(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(15),
              child: ListView(
                children: snapshot.data!.docs.map((document) {
                    return Card(
                        child: Column(
                           children: [
                              Text(document['Title'],
                              style: TextStyle(fontSize: 20),),
                            Text(document['Note'],
                              style: TextStyle(fontSize: 15,),)
                          ]
                      )
                  );
                  }
                ).toList(),
              ),
            ),
          );
        }
        return SizedBox();
      }
    );
  }
}
