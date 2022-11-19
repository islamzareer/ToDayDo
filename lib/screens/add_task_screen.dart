import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/tasks_data.dart';

class AddTaskScren extends StatefulWidget {
  const AddTaskScren({super.key});

  @override
  State<AddTaskScren> createState() => _AddTaskScrenState();
}

class _AddTaskScrenState extends State<AddTaskScren> {
  DateTime selectedDate = DateTime.now();
  bool selected = false;
  TextEditingController taskNmaeController = TextEditingController();
  List<String> types = [
    "Inbox",
    "Welcome",
    "Work",
    "Personal",
    "Shopping",
    "WishList",
    "Birthday"
  ];
  String? selectedType = "Inbox";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selected = true;
      });
    }
  }

  String newTaskTitle = "";
  @override
  void initState() {
    taskNmaeController.addListener(() {
      setState(() {
        newTaskTitle = taskNmaeController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: TextField(
                controller: taskNmaeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tittle',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(89, 69, 69, 1))),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  setState(() {
                    newTaskTitle = newText;
                  });
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(
                  Icons.date_range,
                  size: 30,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton(
                items: types
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                      selectedType = value;
                    }),
                value: selectedType),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                if (newTaskTitle != "" && selected != false) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle, selectedDate, selectedType);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Name & Date of task can\'t be null',
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
          ],
        ),
      ]),
    );
  }
}
