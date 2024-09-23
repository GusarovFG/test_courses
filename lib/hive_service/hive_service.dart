import 'package:hive/hive.dart';
import 'package:test_courses/models/courses_model/courses_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  final String boxName = 'courses';

  Future<Box<Courses>> get _box async => Hive.box(boxName);

  init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(CoursesAdapter());

    await Hive.openBox<Courses>(boxName);
  }

  Future<List<Courses>> getCourses() async {
    final box = await _box;
    return box.values.toList();
  }
}
