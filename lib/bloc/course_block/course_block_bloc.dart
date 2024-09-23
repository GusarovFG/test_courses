import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:test_courses/bloc/course_block/index.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:test_courses/repository/local_repository.dart/local_courses_repository.dart';

class CourseBloc extends Bloc<CourseBlockEvent, CourseBlocState> {
  CourseBloc() : super(CourseInitial()) {
    on<CourseBlockEventLoad>(charactersEventLoad);
  }

  FutureOr<void> charactersEventLoad(
      CourseBlockEventLoad event, Emitter<CourseBlocState> emit) async {
    emit(CourseFetchingLoading());

    try {
      List<Course> courses = await LocalCoursesRepository().getCourses();
      print(courses);

      emit(CourseFetchingSuccess(courses));
    } catch (e) {
      emit(CourseFetchingError(e.toString()));
    }
  }
}
