import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_abrar/Provider/note_provider.dart';

import '../Model/note_model.dart';

class NewNoteScreen extends StatelessWidget {
  NewNoteScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "New Note",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Add Note",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: const Text("Title"),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: const Text("Description"),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            descController.text.isNotEmpty) {
                          context.read<NoteProvider>().addNote(NoteModel(
                                user_id: 0,
                                note_Id: 0,
                                note_Title: titleController.text.toString(),
                                note_Desc: descController.text.toString(),
                              ));
                        }
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
