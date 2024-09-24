import 'package:meta/meta.dart';

@immutable
abstract class CourseBlockEvent {}

class CourseBlockEventLoad extends CourseBlockEvent {}
