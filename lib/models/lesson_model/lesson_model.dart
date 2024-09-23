import 'dart:convert';

import 'package:hive/hive.dart';

part 'lesson_model.g.dart';

@HiveType(typeId: 2)
class Lesson {
  @HiveField(0)
  String name;

  @HiveField(1)
  String video;

  Lesson({
    required this.name,
    required this.video,
  });

  factory Lesson.fromRawJson(String str) => Lesson.fromJson(json.decode(str));

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        name: json["name"],
        video: json["video"],
      );
}
