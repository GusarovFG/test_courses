import 'package:test_courses/models/course_model/course_model.dart';

sealed class CourseBlocState {}

abstract class CourseActionState extends CourseBlocState {}

class CourseInitial extends CourseBlocState {}

class CourseFetchingLoading extends CourseActionState {}

class CourseFetchingError extends CourseActionState {
  final String errorMessage;

  CourseFetchingError(this.errorMessage);
}

class CourseFetchingSuccess extends CourseBlocState {
  final List<Course> courses;

  CourseFetchingSuccess(this.courses);
}
