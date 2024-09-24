import 'package:hive/hive.dart';
import 'package:test_courses/models/course_model/course_model.dart';
import 'package:test_courses/models/courses_model/courses_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:test_courses/models/lesson_model/lesson_model.dart';

class HiveService {
  final String boxName = 'courses';

  Future<Box<Courses>> get _box async => Hive.box(boxName);

  //Инициализация и реализация бокса
  init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(CoursesAdapter())
      ..registerAdapter(CourseAdapter())
      ..registerAdapter(LessonAdapter());

    await Hive.openBox<Courses>(boxName);
  }

  //Получение всех Курсов
  Future<List<Courses>> getCourses() async {
    final box = await _box;
    return box.values.toList();
  }

  //Сохранение курсов в базе данных(если данные с сервера отличаются от данных в базе данных, то данные заменяются)
  Future<void> addCourses(Courses courses) async {
    final box = await _box;
    if (box.values.isEmpty) {
      await box.add(courses);
    } else if (!box.values.toList().contains(courses)) {
      box.clear();
      box.add(courses);
    } else {
      return;
    }
  }
}
