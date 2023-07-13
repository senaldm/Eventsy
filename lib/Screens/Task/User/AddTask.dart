// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:eventsy/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart';
// import 'package:eventsy/main.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskController = TextEditingController();
  final vendorController = TextEditingController();
  final categoryController = TextEditingController();
  final budgetController = TextEditingController();
  final statusController = TextEditingController();
  String taskName = '';
  String categoryName = '';
  String vendorName = '';
  String budget = '';
  bool isComplete = false;

  final String label = "Task Completed/Incompleted";

  final bool value = false;
  final bool onChanged = true;
  final _formKey = GlobalKey<FormState>();
  final List<Task> task = [];
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
            backgroundColor: Colors.blueGrey.shade900,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.1),

              // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

              child: AppBar(
                titleSpacing: 2.2,
                forceMaterialTransparency: false,
                backgroundColor: Colors.greenAccent.shade700,
                automaticallyImplyLeading: true,
                centerTitle: true,
                flexibleSpace: Center(
                  child: Text(
                    'Task List',
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            body: Form(
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
                        onChanged: (String? categoryName) {
                          // setState(() {
                          //   categoryName = categoryName;
                          // });
                        },
                        items: <String>[
                          'Decoration',
                          'Food and Beverages',
                          ' Option 3',
                          ' Option 4',
                          ' Option 5',
                          ' Option 6',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                              width: 290,
                              height: 60,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
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
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade900,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        focusColor: Colors.white,
                        dropdownColor: Colors.blueGrey.shade900,
                      ),
                    ),

                    SizedBox(
                      height: width * 0.05,
                    ),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0)),
                    //   margin: EdgeInsets.only(
                    //       left: width * 0.15, right: width * 0.15),
                    //   borderOnForeground: false,
                    //   // child:DropdownButton<String>(
                    //   //   value:category,
                    //   //   items: <String>['Birthday','Ceremony','Wedding'].map<DropDownItem<String>>((String value){
                    //   //   }).toList(),
                    //   // )
                    // ),
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
                        child: TextField(
                          controller: taskController,
                          // onChanged: (value) {
                          //   if (taskName.isEmpty) {
                          //     setValidator(true);
                          //   } else {
                          //     setValidator(false);
                          //   }
                          //   taskName:
                          //   value;

                          // },
                          decoration: InputDecoration(
                            errorText:
                                isFilled ? null : "Please enter a task name",
                            border: OutlineInputBorder(),
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
                          // onChanged: (value) {
                          //   vendorName:
                          //   value;
                          // },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
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
                          // onChanged: (value) {
                          //   budget:
                          //   value;
                          // },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ' Budget ',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: label,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                // decoration: TextDecoration.underline,
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     debugPrint('Label has been tapped.');
                              //   },
                            ),
                          ),
                        ),
                        // Switch(
                        //   value: value,
                        //   onChanged: (newValue) {
                        //     isComplete = newValue;
                        //   },
                        // ),
                        // Container(
                        //     //  margin: EdgeInsets.only(
                        //     // left: width * 0.15, right: width * 0.15),
                        //     child: Text(
                        //   "Task Completed/Incompleted",
                        //   style: TextStyle(
                        //       color: Colors.white70, fontSize: width * 0.05),
                        // )),
                        // SizedBox(
                        //   width: width * 0.05,
                        // ),
                        // Switch(
                        //   value: false,
                        //   onChanged: (bool newValue) {
                        //     onChanged(newValue);

                        //     // setState(() => newValue = true);
                        //     // value:
                        //     // newValue;
                        //   },
                        //   // overrides the default green color of the track
                        //   activeColor: Colors.green.shade700,
                        //   // color of the round icon, which moves from right to left
                        //   thumbColor: Colors.green.shade900,
                        //   // when the switch is off
                        //   trackColor: Colors.black,
                        //   // boolean variable value

                        //   // changes the state of the switch
                        //   // onChanged: (value) =>
                        //   //     setState(() => isComplete = value),
                        // ),
                      ],
                    )
                    //
                  ]),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Colors.greenAccent.shade700,
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
                          Navigator.pushNamed(context, '/TaskList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      FloatingActionButton.extended(
                        heroTag: Text('save'),
                        onPressed: () async {
                          await addTask(
                            categoryName,
                            taskController.text,
                            vendorController.text,
                            budgetController.text,
                            isComplete,
                          );
                          Navigator.pop(context);
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Save ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  bool isFilled = true;
  void setValidator(valid) {
    setState(() {
      isFilled = valid;
    });
  }

  // addTask(String categoryName, String taskName, String vendorName,
  //     String budget, bool isComplete) async {
  // final task = Task(
  //   categoryName: categoryName,
  //   taskName: taskName,
  //   isComplete: isComplete,
  //   vendorName: vendorName,
  //   budget: budget,
  // );
//     events.eventName = eventName!;

  // taskBox = await Hive.openBox<Task>('task');
  // if (_formKey.currentState!.validate()) {
  //   // Save the form data to Hive
  //   taskBox.put('taskName', taskController.text as Task);
  //   taskBox.put('vendorName', vendorController.text as Task);
  //   taskBox.put('budget', budgetController.text as Task);
  //  taskBox.put('categoryName', categoryName as Task);
  //  taskBox.put('isComplete', isComplete as Task);
  // }

  // taskBox.putAll({'taskName': taskController.text, 'vendorName': vendorController.text,'budget':budgetController,'categoryName':categoryName,'isComplete':isComplete});
  // var check = taskBox.add(task);
  // if (check == true) {
  // Navigator.pushNamed(context, '/TaskList');
  addTask(String categoryName, String taskName, String vendorName,
      String budget, bool isComplete) async {
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final filePath = '${appDocumentDir.path}/tasks.txt';
    taskBox = await Hive.openBox<Task>('task');

    if (_formKey.currentState!.validate()) {
      categoryName = categoryController.text;
      taskName = taskController.text;
      vendorName = vendorController.text;
      budget = budgetController.text;
      isComplete = false;

      // Create a new Task object
      final task = Task(
        categoryName: categoryName,
        taskName: taskName,
        vendorName: vendorName,
        budget: budget,
        isComplete: isComplete,
      );

      // Store the task in Hive
      storeTask(task);

      // Clear form data
      categoryController.clear();
      taskController.clear();
      vendorController.clear();
      budgetController.clear();
    }

    // if (_formKey.currentState!.validate()) {
    //   // Create a Task object
    //   final task = Task(
    //     categoryName: categoryName,
    //     taskName: taskName,
    //     vendorName: vendorName,
    //     budget: budget,
    //     isComplete: isComplete,
    //   );

    //     final file = File(filePath);
    //   final tasks = await readTasksFromFile(file);
    //   // Save the task to Hive
    //  taskBox.add(task);
    //   final addedTaskIndex = taskBox.values.toList().indexOf(task);
    //   if (addedTaskIndex != -1) {
    //     if (kDebugMode) {
    //       print('Task added successfully!');
    //     }
    //   } else {
    //     if (kDebugMode) {
    //       print('Failed to add task.');
    //     }
    //   }
    //  Navigator.pushNamed(context,'TaskList');
    // }

    // }
  }

  Future<void> storeTask(Task task) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/tasks.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    final taskData =
        '${task.categoryName},${task.taskName},${task.vendorName},${task.budget},${task.isComplete}\n';
    await file.writeAsString(taskData, mode: FileMode.append);
  }
}
//   Future<List<Task>> readTasksFromFile(File file) async {
//     if (await file.exists()) {
//       final contents = await file.readAsString();
//       final taskList = contents.split('\n');
//       final tasks = taskList.map((taskStr) {
//         final taskData = taskStr.split('|');
//         return Task(
//           categoryName: taskData[0],
//           taskName: taskData[1],
//           vendorName: taskData[2],
//           budget: taskData[3],
//           isComplete: taskData[4] == 'true',
//         );
//       }).toList();
//       return tasks;
//     } else {
//       return [];
//     }
//   }

//   Future<void> writeTasksToFile(File file, List<Task> tasks) async {
//     final lines = tasks.map((task) {
//       final taskStr =
//           '${task.categoryName}|${task.taskName}|${task.vendorName}|${task.budget}|${task.isComplete}';
//       return taskStr;
//     }).toList();
//     final contents = lines.join('\n');
//     await file.writeAsString(contents);
//   }
// }
