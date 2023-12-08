import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_abrar/Provider/note_provider.dart';
import 'package:todo_note_abrar/Screens/new_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*List<NoteModel> data = [];
  int? uid = 0;
  late AppDataBase appData;*/

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NoteProvider>().getAllNotes();
    /*appData = AppDataBase.instance;
    getAllNotes();*/
  }

  /*void getAllNotes() async {
    data = await appData.fetchNotes();
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<NoteProvider>(builder: (ctx, provider, child) {
        var notes = provider.getNotes();
        return notes.isNotEmpty
            ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (ctx, index) {
                  var currData = notes[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(currData.note_Title),
                    subtitle: Text(currData.note_Desc),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              /* openBottomSheet(
                                isUpdate: true,
                                noteId: currData.note_Id,
                                noteTitle: currData.note_Title,
                                noteDesc: currData.note_Desc,
                              );*/
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Delete?"),
                                    content: const Text(
                                        "Are you sure want to delete?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          /// delete operations
                                          /*  appData.deleteNote(note.note_Id);
                                          getAllNotes();*/
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text("No any notes added"),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// For Bottom Sheet
          //openBottomSheet();
          /// For Next Page to Get Data
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => NewNoteScreen()));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  /*void openBottomSheet({
    bool isUpdate = false,
    int noteId = 0,
    String noteTitle = "",
    String noteDesc = "",
  }) {
    titleController.text = noteTitle;
    descController.text = noteDesc;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    isUpdate ? "Update Note" : "Add Note",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
                            if (isUpdate) {
                              /// Update Note
                              appData.updateNote(NoteModel(
                                note_Id: noteId,
                                note_Title: titleController.text.toString(),
                                note_Desc: descController.text.toString(),
                              ));
                            } else {
                              /// Add Note
                              appData.addNote(
                                NoteModel(
                                  note_Id: 0,
                                  note_Title: titleController.text.toString(),
                                  note_Desc: descController.text.toString(),
                                ),
                              );
                            }
                          }
                          getAllNotes();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          isUpdate ? "Update" : "Add",
                          style: const TextStyle(
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
          );
        });
  }*/
}
