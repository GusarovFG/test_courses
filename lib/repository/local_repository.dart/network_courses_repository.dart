import 'package:dio/dio.dart';
import 'package:test_courses/models/course_model/course_model.dart';

class NetworkCoursesRepository {
  static final NetworkCoursesRepository _singleton =
      NetworkCoursesRepository._internal();
  final Dio dio = Dio();
  List<Course> courses = [];

  factory NetworkCoursesRepository() {
    return _singleton;
  }

  NetworkCoursesRepository._internal();

  Future<List<Course>> getCurses() async {
    const url = 'https://my-json-server.typicode.com/GusarovFG/test_courses';
    try {
      final response = await dio.get(url);

      if (response.data['courses'] != null) {
        List result = response.data['courses'];

        for (int i = 0; i < result.length; i++) {
          Course course = Course.fromJson(result[i]);
          courses.add(course);
        }

        return courses;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response);

        if (error.response?.statusCode == 404) return [];
      } else {
        print(error);
      }
    }
    return [];
  }
}
