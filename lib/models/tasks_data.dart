import 'package:flutter/material.dart';
import 'package:todaydo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  List<Task> completedTasks = [];
  String selectedType = "Inbox";
  void addTask(newTaskName, date, type) {
    tasks.add(Task(name: newTaskName, date: date));
    notifyListeners();
  }

  void setType(String type) {
    selectedType = type;
    notifyListeners();
  }
  String getselectedType(){
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
