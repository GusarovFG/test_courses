import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_courses/bloc/course_block/course_block_bloc.dart';
import 'package:test_courses/bloc/course_block/course_block_event.dart';
import 'package:test_courses/bloc/course_block/course_block_state.dart';

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
    return BlocConsumer<CourseBloc, CourseBlocState>(
      bloc: _bloc,
      listener: (BuildContext context, Object? state) {},
      listenWhen: (previous, current) => current is CourseActionState,
      buildWhen: (previous, current) => current is! CourseActionState,
      builder: (BuildContext context, state) {
        switch (state.runtimeType) {
          case CourseFetchingLoading:
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          case CourseFetchingError:
            final errorstate = state as CourseFetchingError;
            return Center(child: Text(errorstate.errorMessage));
          case CourseFetchingSuccess:
            final successstate = state as CourseFetchingSuccess;
            print(successstate.courses);
            return ListView.builder(
                itemCount: successstate.courses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.courses[index].name),
                    subtitle: Text(state.courses[index].description),
                  );
                });
          default:
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
        }
      },
    );
  }
}
