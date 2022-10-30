import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        title: 'ToDayDo',
        home: TasksScreen(),
      ),
    );
  }
}
