import 'package:flutter/material.dart';
import 'package:todaydo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(newTaskName) {
    tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeStatus(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
