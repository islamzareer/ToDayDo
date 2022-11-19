class Task {
  String name;
  bool isDone;
  DateTime date;
  String type ;
  Task({required this.name, this.isDone = false, required this.date, this.type= "Inbox"});
  void changeStatus(Task task) {
    task.isDone = !isDone;
  }
}
