// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_switch/sliding_switch.dart';

class UpdateEventTask extends StatefulWidget {
  final EventTasks task;
  final Event event;
  const UpdateEventTask({required this.task, required this.event});

  @override
  _UpdateEventTaskState createState() => _UpdateEventTaskState();
}

class _UpdateEventTaskState extends State<UpdateEventTask> {
  late String taskKey;
  late String eventKey;
  late String eventName;
  late DateTime taskTimestamp;

  final taskController = TextEditingController();
  final vendorController = TextEditingController();
  // final categoryController = TextEditingController();
  final budgetController = TextEditingController();
  final statusController = TextEditingController();
  bool isComplete = false;

  final String label = "Task Completed/Incompleted";
  late bool isSwitchOn;
  late String categoryName;

  late EventTasks currentTask;
  late Event currentEvent;
  // final bool value = false;
  final bool onChanged = true;
  final _formKey = GlobalKey<FormState>();
  // final List<Task> task = [];

  Box<EventTasks>? taskBox;
  List taskDetails = [];
  late String timestamp;

  @override
  void initState() {
    super.initState();
    currentTask = widget.task;
    currentEvent = widget.event;
    openHiveBox();
    currentTask.taskName.isEmpty
        ? currentTask.taskName = " "
        : currentTask.taskName;
    currentTask.vendorName.isEmpty
        ? currentTask.vendorName = " "
        : currentTask.vendorName;
    currentTask.categoryName.isEmpty
        ? currentTask.categoryName = "Decoration"
        : currentTask.categoryName;

    taskController.text = currentTask.taskName;
    vendorController.text = currentTask.vendorName;
    budgetController.text = currentTask.budget;
    categoryName = currentTask.categoryName;
    isSwitchOn = currentTask.isComplete;
    taskKey = currentTask.taskKey;
    eventKey = currentTask.eventKey;
    eventName = currentTask.eventName;
    taskTimestamp = currentTask.taskTimestamp;
    timestamp = currentTask.timestamp?.toIso8601String() ?? '';
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    taskBox = await Hive.openBox<EventTasks>('eventTasks');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        // ignore: sort_child_properties_last
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: Color.fromARGB(255, 18, 140, 126),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.1),

              // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

              child: AppBar(
                titleSpacing: 2.2,
                forceMaterialTransparency: false,
                backgroundColor: Color.fromARGB(255, 18, 140, 126),
                automaticallyImplyLeading: true,
                centerTitle: true,
                flexibleSpace: Center(
                  child: Text(
                    'Update Task',
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontFamily: 'Roboto',
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            body: WillPopScope(
              onWillPop: () async {
                await Navigator.pushNamed(context, '/viewEventTask',
                    arguments: {
                      'task': currentTask,
                      'event': currentEvent,
                    });
                return false;
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),

                          borderOnForeground: false,
                          // child:SingleChildScrollView(
                          child: DropdownButtonFormField<String>(
                            value: categoryName,
                            onChanged: (String? newValue) {
                              setState(() {
                                categoryName = newValue!;
                              });
                            },
                            items: <String>[
                              'Decoration',
                              'Food and Beverages',
                              'Option 3',
                              'Option 4',
                              'Option 5',
                              'Decorations',
                              'Food and Beveragess',
                              'Option 3s',
                              'Option 4s',
                              'Option 5s',
                              'Decorationy',
                              'Food and Beveragesy',
                              'Option 3y',
                              'Option 4y',
                              'Option 5y',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width: 290,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            style: const TextStyle(
                              color: Colors.white,
                              // fontSize: 20.0,
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Add Category',
                              style: TextStyle(color: Colors.black),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade900,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(
                                Icons.category_outlined,
                              ),
                            ),
                            focusColor: Colors.white,
                            dropdownColor: Colors.blueGrey.shade900,
                          ),
                        ),

                        SizedBox(
                          height: width * 0.05,
                        ),

                        SizedBox(
                          height: width * 0.05,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: Hero(
                            tag: 'taskName',
                            child: TextFormField(
                              controller: taskController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a task name";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  isFilled = value.isNotEmpty;
                                });
                              },
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon: Icon(Icons.task_outlined),
                                hintText: 'Task Name',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: Hero(
                            tag: 'vendorName',
                            child: TextField(
                              controller: vendorController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon:
                                    Icon(Icons.business_center_outlined),
                                hintText: 'Vendor Name',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: Hero(
                            tag: 'budget',
                            child: TextField(
                              controller: budgetController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon: Icon(Icons.attach_money_rounded),
                                hintText: ' Budget ',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: width * 0.05,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: label,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromARGB(255, 18, 140, 126),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SlidingSwitch(
                              value: isSwitchOn,
                              width: 100,
                              height: 50,
                              onTap: () {},
                              onDoubleTap: () {},
                              onSwipe: () {},
                              iconOff: Icons.cancel_rounded,
                              iconOn: Icons.done,
                              contentSize: 24,
                              colorOn: Color.fromARGB(255, 10, 224, 17),
                              colorOff: Color.fromARGB(255, 126, 19, 11),
                              background: Colors.black87,
                              buttonColor: const Color(0xfff7f5f7),
                              inactiveColor: const Color(0xff636f7b),
                              onChanged: (bool newValue) {
                                setState(() {
                                  isSwitchOn = newValue;
                                });
                              },
                            ),
                          ],
                        )
                        //
                      ]),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Color.fromARGB(255, 18, 140, 126),
                height: 90,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton.extended(
                        heroTag: Text('cancel'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/EventTaskList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      FloatingActionButton.extended(
                        heroTag: Text('Update'),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            await updateEventTask(
                              categoryName,
                              taskController.text,
                              vendorController.text,
                              budgetController.text,
                              isSwitchOn,
                            );

                            //trying to view the updated the task

                            await Navigator.pushNamed(context, '/viewEventTask',
                                arguments: {
                                  'task': currentTask,
                                  'event': currentEvent,
                                });

                            // Navigator.pushNamed(context, 'TaskList');
                          }
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Update ',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  void doNothing() {}

  bool isFormValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  bool isFilled = false;
  void setValidator(valid) {
    setState(() {
      isFilled = valid;
    });
  }

  Future<void> updateEventTask(String categoryName, String taskName,
      String vendorName, String budget, bool isSwitchOn) async {
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final filePath = '${appDocumentDir.path}/tasks.txt';
    taskBox = await Hive.openBox<EventTasks>('eventTask');

    if (_formKey.currentState!.validate()) {
      // Task? = taskBox?.get(taskKey);

      // if (!= null) {
      categoryName = categoryName;
      taskName = taskController.text;
      vendorName = vendorController.text;
      budget = budgetController.text;
      isComplete = isSwitchOn;
      timestamp = DateTime.now().toIso8601String();

      // Create a new Task object
      final task = EventTasks(
          eventKey: eventKey,
          eventName: eventName,
          taskTimestamp: taskTimestamp,
          taskKey: taskKey,
          categoryName: categoryName,
          taskName: taskName,
          vendorName: vendorName,
          budget: budget,
          isComplete: isComplete);

      // Store the task in Hive
      await taskBox?.put(taskKey, task);
      setState(() {
        currentTask = task;
      });

      await updateEventTaskInLocal(task);
      // }
      // Clear form data
      // categoryController.clear();
      taskController.clear();
      vendorController.clear();
      budgetController.clear();
    }
  }

  Future<void> updateEventTaskInLocal(EventTasks task) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/eventTasks.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    final lines = await file.readAsLines();
    final updatedLines = <String>[];

    for (final line in lines) {
      final taskData = line.split(',');

      if (taskData[0] == task.taskKey) {
        // Replace the line with the updated task data

        final formattedTimestamp = task.timestamp?.toIso8601String() ?? '';

        final updatedTaskData =
            '${task.eventKey},${task.eventName},${task.taskKey},${task.categoryName},${task.taskName},${task.vendorName},${task.budget},${task.isComplete},$formattedTimestamp';
        updatedLines.add(updatedTaskData);
      } else {
        // Add other tasks as they are
        updatedLines.add(line);
      }
    }

    await file.writeAsString(updatedLines.join('\n'));
  }
}
