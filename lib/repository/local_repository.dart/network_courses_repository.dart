import 'package:test_courses/hive_service/hive_service.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:test_courses/models/courses_model/courses_model.dart';

class NetworkCoursesRepository {
  static final NetworkCoursesRepository _singleton =
      NetworkCoursesRepository._internal();
  final HiveService _hiveService = HiveService();
  factory NetworkCoursesRepository() {
    return _singleton;
  }

  NetworkCoursesRepository._internal();

  Future<List<Course>> fetchCourses() async {
    var response = await rootBundle.loadString("assets/db.json");

    if (response.isNotEmpty) {
      final courses = Courses.fromRawJson(response);
      _hiveService.addCourses(courses);
      return courses.courses;
    } else {
      return [];
    }
  }
}
