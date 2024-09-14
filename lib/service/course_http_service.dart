import "dart:convert";
import "package:http/http.dart" as http;
import "package:vazifa_13/model/course.dart";

class CoursesHttpService {
  Future<Course> getCourses() async {
    Uri url = Uri.parse(
        "https://dars-f31ed-default-rtdb.asia-southeast1.firebasedatabase.app/courses.json");

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      return Course.fromJson(data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return Course(
        title: "title",
        description: "description",
        imageUrl: "imageUrl",
        price: 12,
        lessons: <String, dynamic>{});
  }
}
