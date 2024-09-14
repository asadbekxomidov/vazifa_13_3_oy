import 'package:flutter/material.dart';
import 'package:vazifa_13/views/screens/main_screen.dart';
import 'package:vazifa_13/views/screens/manage_expense_screen.dart';
import 'package:vazifa_13/views/screens/note_screen.dart';
import 'package:vazifa_13/views/screens/settings_screen.dart';
import 'package:vazifa_13/views/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      routes: {
        "/main": (context) => const MainScreen(),
        "/todo": (context) => const ToDoScreen(),
        "/note": (context) => const NoteScreen(),
        "/settings": (context) => const SettingsScreen(),
        "/manage": (context) => const ManageNoteScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
