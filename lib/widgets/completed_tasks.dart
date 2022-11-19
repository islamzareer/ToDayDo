import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/widgets/task_tile.dart';

class CompletedTasksList extends StatefulWidget {
  const CompletedTasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletedTasksList> createState() => _CompletedTasksListState();
}

class _CompletedTasksListState extends State<CompletedTasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          itemCount: taskData.completedTasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              task: taskData.completedTasks[index],
              checkboxChange: (newValue) {},
              listTileDelete: () {},
            );
          },
        );
      },
    );
  }
}
