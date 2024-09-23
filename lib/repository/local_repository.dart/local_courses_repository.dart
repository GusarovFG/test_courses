import 'package:test_courses/hive_service/hive_service.dart';
import 'package:test_courses/models/course_model/course_model.dart';

class LocalCoursesRepository {
  static final LocalCoursesRepository _singleton =
      LocalCoursesRepository._internal();

  final hive = HiveService();

  factory LocalCoursesRepository() {
    return _singleton;
  }

  LocalCoursesRepository._internal();

  Future<List<Course>> getCourses() async {
    List<Course> courses = [];
    await hive.getCourses().then((value) {
      courses = value.first.courses;
    });
    return courses;
  }
}
