class SubTask {
  String name;
  bool isDone;
  SubTask({
    required this.name,
    this.isDone = false,
  });
  void changeStatus(SubTask task) {
    task.isDone = !isDone;
  }
}
