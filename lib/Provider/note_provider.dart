import 'package:flutter/material.dart';
import 'package:todo_note_abrar/AppDataBase/app_db.dart';

import '../Model/note_model.dart';

class NoteProvider extends ChangeNotifier {
  NoteProvider({required this.db});

  AppDataBase db;

  List<NoteModel> _arrayNotes = [];
  List<NoteModel> getNotes() => _arrayNotes;

  void getAllNotes() async {
    _arrayNotes = await db.fetchNotes();
    notifyListeners();
  }

  void addNote(NoteModel newNote) async {
    await db.addNote(newNote);
    _arrayNotes = await db.fetchNotes();
    notifyListeners();
  }

  void deleteNote(int id) async {
    db.deleteNote(id);
    _arrayNotes = await db.fetchNotes();
    notifyListeners();
  }

  void updateNote(NoteModel updateNote) async {
    db.updateNote(updateNote);
    _arrayNotes = await db.fetchNotes();
    notifyListeners();
  }
}
