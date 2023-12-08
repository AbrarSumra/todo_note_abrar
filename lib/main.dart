import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_abrar/AppDataBase/app_db.dart';
import 'package:todo_note_abrar/Provider/note_provider.dart';
import 'package:todo_note_abrar/Screens/splash_screen.dart';

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
      home: const SplashScreen(),
    );
  }
}
