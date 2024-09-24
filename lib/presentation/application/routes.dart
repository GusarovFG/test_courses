import 'package:flutter/material.dart';
import 'package:test_courses/presentation/detail_screen/detail_screen.dart';
import 'package:test_courses/presentation/main_screen/main_screen.dart';

class Routes {
  static final routes = {
    '/': (BuildContext context) => const MainScreen(),
    '/Detail': (BuildContext context) => const DetailScreen(),
  };
}
