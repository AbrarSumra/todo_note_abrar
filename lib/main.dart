import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_abrar/AppDataBase/app_db.dart';
import 'package:todo_note_abrar/Provider/note_provider.dart';
import 'package:todo_note_abrar/Screens/home_screen.dart';
import 'package:todo_note_abrar/Screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteProvider(db: AppDataBase.instance),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
