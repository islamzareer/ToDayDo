import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/subtask.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/models/tasks_data.dart';
import 'package:todaydo/widgets/details_list.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  late Task task;
  DetailsScreen({super.key, required this.task});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
  String newSubTaskTitle = "";
  @override
  void initState() {
    taskNmaeController.addListener(() {
      setState(() {
        newSubTaskTitle = taskNmaeController.text;
      });
    });
    super.initState();
  }

  String? selectedType = "Inbox";

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<TaskData>(context, listen: false)
        .tasks
        .indexOf(widget.task);
    selectedType =
        Provider.of<TaskData>(context, listen: false).tasks[index].type;

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(89, 69, 69, 1),
            body: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white, size: 30),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  alignment: Alignment.center,
                                  iconDisabledColor: Colors.white,
                                  iconEnabledColor: Colors.white,
                                  dropdownColor:
                                      const Color.fromARGB(255, 105, 88, 88),
                                  items: types
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ))
                                      .toList(),
                                  onChanged: (value) => setState(() {
                                        selectedType = value;
                                      }),
                                  value: selectedType),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30,
                          )
                        ]),
                    const Divider(
                      color: Colors.white,
                    ),
                    Text("${widget.task.date.toLocal()}".split(' ')[0],
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white30)),
                    const SizedBox(height: 5),
                    Text(widget.task.name,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: taskNmaeController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (newText) {
                              setState(() {
                                newSubTaskTitle = newText;
                              });
                            },
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: 'Add SubTask',
                                hintStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                        IconButton(
                            icon: (const Icon(Icons.add,
                                color: Colors.white, size: 30)),
                            onPressed: () {
                              if (newSubTaskTitle != "") {
                                setState(() {
                                  Provider.of<TaskData>(context, listen: false)
                                      .tasks[index]
                                      .subtasks
                                      .add(SubTask(name: newSubTaskTitle));
                                  taskNmaeController.clear();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                });
                              }
                            })
                      ],
                    ),
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
                          child: DetailsList(task: widget.task)),
                    )
                  ],
                ),
              ),
            )));
  }
}
