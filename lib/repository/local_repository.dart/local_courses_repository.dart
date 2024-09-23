class LocalCoursesRepository {
  static final LocalCoursesRepository _singleton =
      LocalCoursesRepository._internal();

  factory LocalCoursesRepository() {
    return _singleton;
  }

  LocalCoursesRepository._internal();
}
