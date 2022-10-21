import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class NoteBox extends StatelessWidget {

  NoteBox({Key? key, this.padding}) : super(key: key);
  final EdgeInsetsGeometry? padding;
  CollectionReference notes =FirebaseFirestore.instance.collection('Note');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: notes.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        try {
          if(snapshot.hasError){
            return const Center(child: Text("Something went wrong", style: TextStyle(color: Colors.red,),));
          }
        } on Exception catch (e) {
          print(e);
        }
        /*if(snapshot.hasData && !snapshot.data.){
          return const Center(child: Text("Document Problem", style: TextStyle(color: Colors.red,),));
        }*/
        if(snapshot.connectionState == ConnectionState.done){
          return Container(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(15),
              child: ListView(
                children: snapshot.data!.docs.map((document) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                      Text(document['Title'], style: TextStyle(fontSize: 20),),
                      Text(document['Note'], style: TextStyle(fontSize: 15,),)
                    ]
                  );
                }).toList(),
              ),
            ),
          );
        }
        return Text("Another");
      }
    );
  }
}
