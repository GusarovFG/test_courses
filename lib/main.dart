import 'package:flutter/material.dart';
import 'package:test_courses/hive_service/hive_service.dart';
import 'package:test_courses/presentation/application/application.dart';
import 'package:test_courses/repository/local_repository.dart/network_courses_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  NetworkCoursesRepository().fetchCourses();
  runApp(const Application());
}
