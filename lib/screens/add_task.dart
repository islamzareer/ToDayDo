import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/tasks_data.dart';

class AddTaskScren extends StatelessWidget {
  const AddTaskScren({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        const Text(
          "Add Task",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Color.fromRGBO(89, 69, 69, 1)),
        ),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          onChanged: (newText) {
            newTaskTitle = newText;
          },
        ),
        TextButton(
          onPressed: () {
            if (newTaskTitle != "") {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Name of task can\'t be null',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.white,
                ),
              );
            }
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(89, 69, 69, 1),
              foregroundColor: Colors.white),
          child: const Text("Add"),
        )
      ]),
    );
  }
}
