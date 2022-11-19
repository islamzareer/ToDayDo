import 'package:flutter/material.dart';
import 'package:todaydo/models/subtask.dart';
import 'package:todaydo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  List<Task> completedTasks = [];
  List<SubTask> subtasks = [];
  late String selectedType = "Inbox";
  void addTask(newTaskName, date, type) {
    tasks.add(Task(name: newTaskName, date: date, type: type));
    notifyListeners();
  }

  void addSubTask(Task task, name) {
    subtasks.add(SubTask(name: name));
    notifyListeners();
  }

  void updateSubTask(SubTask subtask) {
    subtask.changeStatus(subtask);
    notifyListeners();
  }

  void setType(String type) {
    selectedType = type;
    notifyListeners();
  }

  String getselectedType() {
    return selectedType;
  }

  void updateTask(Task task) {
    task.changeStatus(task);
    completedTasks.add(task);
    deleteTask(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
