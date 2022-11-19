import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final DateTime taskDate;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;

  const TaskTile(
      {super.key,
      this.isChecked = false,
      required this.taskTitle,
      required this.taskDate,
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
        leading: Checkbox(
          activeColor: const Color.fromRGBO(89, 69, 69, 1),
          value: isChecked,
          onChanged: checkboxChange,
        ),
        trailing: isChecked
            ? SizedBox()
            : Text("${taskDate.toLocal()}".split(' ')[0]),
        onLongPress: listTileDelete,
        onTap: () {});
  }
}
