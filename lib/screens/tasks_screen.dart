import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/screens/add_task_screen.dart';
import 'package:todaydo/screens/menu_screen.dart';
import 'package:todaydo/widgets/completed_tasks.dart';
import 'package:todaydo/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String selectedType =
        Provider.of<TaskData>(context, listen: false).getselectedType();
    return SafeArea(
        child: Scaffold(
            key: _key,
            drawer: const MenuScreen(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 228, 223, 223),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScren(),
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(89, 69, 69, 1),
                size: 50,
              ),
            ),
            backgroundColor: const Color.fromRGBO(89, 69, 69, 1),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    IconButton(
                      icon: const Icon(Icons.playlist_add_check,
                          color: Colors.white, size: 45),
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "ToDayDo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.white),
                    )
                  ]),
                  const Divider(
                    color: Colors.white,
                  ),
                  Text(
                      '${Provider.of<TaskData>(context).tasks.where((element) => element.type == selectedType).toList().length} Task/s',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const TasksList()),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const CompletedTasksList()),
                  ),
                ],
              ),
            )));
  }
}
