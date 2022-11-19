import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        List<Task> taskList = taskData.tasks
            .where((element) => element.type == taskData.selectedType)
            .toList();
        
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskList[index].isDone,
              taskTitle: taskList[index].name,
              taskDate: taskList[index].date,
              checkboxChange: (newValue) {
                taskData.updateTask(taskList[index]);
              },
              listTileDelete: () {
                taskData.deleteTask(taskList[index]);
              },
            );
          },
        );
      },
    );
  }
}
