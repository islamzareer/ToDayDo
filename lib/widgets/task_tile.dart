import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;

  const TaskTile(
      {super.key,
      this.isChecked = false,
      required this.taskTitle,
      required this.checkboxChange,
      required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: const Color.fromRGBO(89, 69, 69, 1),
        value: isChecked,
        onChanged: checkboxChange,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Color.fromRGBO(89, 69, 69, 1),
        ),
        onPressed: () {
          listTileDelete();
        },
      ),
    );
  }
}
