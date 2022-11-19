import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        List<Task> TaskList =
            taskData.tasks.where((element) => element.type == taskData.selectedType).toList();
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          itemCount: TaskList.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: TaskList[index].isDone,
              taskTitle: TaskList[index].name,
              taskDate: TaskList[index].date,
              checkboxChange: (newValue) {
                taskData.updateTask(TaskList[index]);
              },
              listTileDelete: () {
                taskData.deleteTask(TaskList[index]);
              },
            );
          },
        );
      },
    );
  }
}
