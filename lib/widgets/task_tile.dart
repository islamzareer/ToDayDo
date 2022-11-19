import 'package:flutter/material.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/screens/details_screen.dart';

class TaskTile extends StatelessWidget {
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;
  final Task task;

  const TaskTile(
      {super.key,
      required this.task,
      required this.checkboxChange,
      required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      leading: Checkbox(
        activeColor: const Color.fromRGBO(89, 69, 69, 1),
        value: task.isDone,
        onChanged: checkboxChange,
      ),
      trailing: task.isDone
          ? const SizedBox()
          : Text("${task.date.toLocal()}".split(' ')[0]),
      onLongPress: listTileDelete,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(task: task)),
        );
      },
    );
  }
}
