import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/subtask.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/widgets/subtask_tile.dart';

// ignore: must_be_immutable
class DetailsList extends StatelessWidget {
  late Task task;
  DetailsList({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        List<SubTask> subtasks = task.subtasks;

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          itemCount: subtasks.length,
          itemBuilder: (context, index) {
            return SubTaskTile(
              subTask: task.subtasks[index],
              checkboxChange: (newValue) {
                taskData.updateSubTask(subtasks[index]);
              },
              listTileDelete: () {},
            );
          },
        );
      },
    );
  }
}
