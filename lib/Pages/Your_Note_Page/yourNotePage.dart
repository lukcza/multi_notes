import 'package:flutter/material.dart';

class YourNotePage extends StatelessWidget {
  const YourNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: GridView.count(
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          children: [

          ],
        ),
      ),
    );
  }
}
