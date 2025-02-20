import 'package:flutter/material.dart';
import 'package:vazifa_13/controllers/course_controller.dart';
import 'package:vazifa_13/views/screens/course_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CourseController courseController = CourseController();

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 4 / 4,
      ),
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/todo");
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Todos",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/note");
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Notes",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
        FutureBuilder(
          future: courseController.course(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Kurs mavjud emas"),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            final course = snapshot.data;
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseScreen(course: course)));
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(course!.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 32),
                width: double.infinity,
                child: Center(
                  child: Text(
                    course.title,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
