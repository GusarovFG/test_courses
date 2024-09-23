import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:test_courses/bloc/course_block/index.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:test_courses/repository/local_repository.dart/local_courses_repository.dart';

class CourseBlockBloc extends Bloc<CourseBlockEvent, CourseBlocState> {
  CourseBlockBloc(super.initialState) {
    on<CourseBlockEvent>((event, emit) {
      FutureOr<void> CourseEventLoad(
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
    });
  }
}
