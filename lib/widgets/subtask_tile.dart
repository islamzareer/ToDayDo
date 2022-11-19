import 'package:flutter/material.dart';
import 'package:todaydo/models/subtask.dart';

class SubTaskTile extends StatelessWidget {
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;
  final SubTask subTask;

  const SubTaskTile(
      {super.key,
      required this.subTask,
      required this.checkboxChange,
      required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        subTask.name,
        style: TextStyle(
            decoration: subTask.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      leading: Checkbox(
        activeColor: const Color.fromRGBO(89, 69, 69, 1),
        value: subTask.isDone,
        onChanged: checkboxChange,
      ),
    );
  }
}
