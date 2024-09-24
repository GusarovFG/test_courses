import 'package:flutter/material.dart';
import 'package:test_courses/models/lesson_model/lesson_model.dart';
import 'package:test_courses/presentation/decoration/box_decor.dart';

class LessonsDetailListtyle extends StatelessWidget {
  final int index;
  final Lesson lesson;
  const LessonsDetailListtyle(
      {super.key, required this.lesson, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecor.decorForTile,
      child: Center(child: Text('${index + 1}. ${lesson.name}')),
    );
  }
}
