import 'package:flutter/material.dart';
import 'package:test_courses/presentation/main_screen/main_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MainScreen()),
    );
  }
}
