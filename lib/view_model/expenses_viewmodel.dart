
import 'package:vazifa_13/model/note.dart';
import 'package:vazifa_13/service/expenses_database.dart';

class NotesViewmodel {
  final _notesDatabase = NotesDatabase();

  List<Note> _list = [];

  Future<List<Note>> list() async {
    _list = await _notesDatabase.getNote();
    return [..._list];
  }

  Future<void> addNote(String title, String subTitle) async {
    await _notesDatabase.addNote({
      "title": title,
      "subTitle": subTitle,
    });
  }

  Future<void> editNote(
    int id,
    String title,
    String subTitle,
  ) async {
    await _notesDatabase.editNote(
      id,
      {
        "title": title,
        "subTitle": subTitle,
      },
    );
  }

  Future<void> deleteNote(int id) async {
    await _notesDatabase.deleteNote(id);
  }
}
