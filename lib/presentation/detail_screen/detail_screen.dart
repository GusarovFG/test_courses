import 'package:flutter/material.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:test_courses/presentation/decoration/box_decor.dart';
import 'package:test_courses/presentation/detail_screen/lessons_detail_listTyle.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context)?.settings.arguments as Course;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.name,
          style: const TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'О курсе',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecor.decorForTile,
                child: Text(course.description)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Уроки',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 15),
                itemCount: course.lessons.length,
                itemBuilder: (context, index) => LessonsDetailListtyle(
                    lesson: course.lessons[index], index: index),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
