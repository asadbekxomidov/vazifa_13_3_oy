// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:vazifa_13/model/quiz.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {

  String courseId;
  String description;
  String title;
  String videoUrl;
  Map<String, Quiz> quizes;

  Lesson(
      {
      required this.courseId,
      required this.description,
      required this.title,
      required this.videoUrl,
      required this.quizes});

  // static Lesson fromJson(Map<String, dynamic> json) {
  //   return _$LessonFromJson(json);
  // }

  // toJson() {
  //   return _$LessonToJson(this);
  // }
}
