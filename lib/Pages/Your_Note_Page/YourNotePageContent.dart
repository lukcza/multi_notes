import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'NoteBox.dart';
class YourNoteContent extends StatelessWidget {
  const YourNoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: MasonryGridView.count(crossAxisCount: 2, itemBuilder: (context, i) {
          return  AnimationConfiguration.staggeredGrid(position: 1, columnCount: 2, child: ScaleAnimation(
            child: FadeInAnimation(
              child:NoteBox(),
            ),
          ));
        }),
      ),
    );
  }
}

