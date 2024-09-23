import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:test_courses/models/course_model/course_model.dart';

part 'courses_model.g.dart';

@HiveType(typeId: 0)
class Courses {
  @HiveField(0)
  List<Course> courses;

  Courses({
    required this.courses,
  });

  factory Courses.fromRawJson(String str) => Courses.fromJson(json.decode(str));

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );
}
