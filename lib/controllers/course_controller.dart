
import 'package:vazifa_13/model/course.dart';
import 'package:vazifa_13/model/lesson.dart';
import 'package:vazifa_13/service/course_http_service.dart';

class CourseController {
  CoursesHttpService coursesHttpService = CoursesHttpService();
  Future<Course> course() async {
    Course course = await coursesHttpService.getCourses();
    return course;
  }

  List<Lesson> getLessons(Map lessonsMap) {
    List<Lesson> lessons = [];
    lessonsMap.forEach((key, value) {
      lessons.add(Lesson.fromJson(value));
    });
    return lessons;
  }
}
