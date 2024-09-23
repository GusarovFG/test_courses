import 'package:test_courses/hive_service/hive_service.dart';
import 'package:test_courses/models/courses_model/courses_model.dart';

class LocalCoursesRepository {
  static final LocalCoursesRepository _singleton =
      LocalCoursesRepository._internal();

  final hive = HiveService();

  factory LocalCoursesRepository() {
    return _singleton;
  }

  LocalCoursesRepository._internal();

  Courses getCourses() {
    Courses courses = Courses(courses: []);
    hive.getCourses().then((value) {
      courses = value.first;
    });
    return courses;
  }
}
