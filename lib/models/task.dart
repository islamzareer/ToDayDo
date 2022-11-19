import 'package:todaydo/models/subtask.dart';

class Task {
  String name;
  bool isDone;
  DateTime date;
  String type;
  List<SubTask> subtasks = [];
  Task(
      {required this.name,
      this.isDone = false,
      required this.date,
      this.type = "Inbox"});
  void changeStatus(Task task) {
    task.isDone = !isDone;
  }
}
