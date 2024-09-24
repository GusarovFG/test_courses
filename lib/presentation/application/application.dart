import 'package:flutter/material.dart';
import 'package:test_courses/presentation/application/routes.dart';

class Application extends StatelessWidget {
  final _routes = Routes.routes;

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _routes,
      initialRoute: _routes.keys.first,
    );
  }
}
