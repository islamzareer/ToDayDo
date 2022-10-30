class Task {
  String name;
  bool isDone;
  Task({required this.name, this.isDone = false});
  void changeStatus(Task task) {
    task.isDone = !isDone;
  }
}
