import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_courses/bloc/course_block/course_block_bloc.dart';
import 'package:test_courses/bloc/course_block/course_block_event.dart';
import 'package:test_courses/bloc/course_block/course_block_state.dart';
import 'package:test_courses/presentation/main_screen/courses_listView/courses_listView.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CourseBloc _bloc = CourseBloc();

  @override
  void initState() {
    _bloc.add(CourseBlockEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Курсы'),
        centerTitle: true,
      ),
      body: BlocConsumer<CourseBloc, CourseBlocState>(
        bloc: _bloc,
        listener: (BuildContext context, Object? state) {},
        listenWhen: (previous, current) => current is CourseActionState,
        buildWhen: (previous, current) => current is! CourseActionState,
        builder: (BuildContext context, state) {
          switch (state.runtimeType) {
            case const (CourseFetchingLoading):
              return const CircularProgressIndicator();
            case const (CourseFetchingError):
              final errorstate = state as CourseFetchingError;

              return Center(child: Text(errorstate.errorMessage));
            case const (CourseFetchingSuccess):
              final successstate = state as CourseFetchingSuccess;

              return CoursesListview(courses: successstate.courses);
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
