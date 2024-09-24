import 'package:flutter/material.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:test_courses/presentation/decoration/box_decor.dart';

class CourseListtile extends StatelessWidget {
  final Course course;
  const CourseListtile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecor.decorForTile,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              course.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              course.description,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
