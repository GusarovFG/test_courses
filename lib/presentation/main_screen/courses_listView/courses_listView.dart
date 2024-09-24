import 'package:flutter/material.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:test_courses/presentation/main_screen/courses_listView/course_listTile.dart';

class CoursesListview extends StatelessWidget {
  final List<Course> courses;
  const CoursesListview({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: CourseListtile(
            course: courses[index],
          ),
          onTap: () => Navigator.pushNamed(context, '/Detail',
              arguments: courses[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 5,
      ),
    );
  }
}
