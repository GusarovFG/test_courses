import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:test_courses/models/lesson_model/lesson_model.dart';

part 'course_model.g.dart';

@HiveType(typeId: 1)
class Course {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  String mainDescription;

  @HiveField(3)
  List<Lesson> lessons;

  Course({
    required this.name,
    required this.description,
    required this.mainDescription,
    required this.lessons,
  });

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        name: json["name"],
        description: json["description"],
        mainDescription: json["main_description"],
        lessons:
            List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
      );
}
