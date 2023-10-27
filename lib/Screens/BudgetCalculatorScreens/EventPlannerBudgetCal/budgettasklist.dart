import 'package:eventsy/Screens/Task/User/userDashboard/vendor/vendor.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/Event.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../global.dart';

class BudgetTaskList extends StatefulWidget {
  final Event budget;
  const BudgetTaskList({required this.budget});
  @override
  _BudgetTaskListState createState() => _BudgetTaskListState();
}

class _BudgetTaskListState extends State<BudgetTaskList> {
  late Event event;
  late String taskKey;
  late String eventKey;
  late String categoryName;
  late String vendorName;
  late String taskName;
  late String budget;
  late String budgetKey;
  final _formKey = GlobalKey<FormState>();
  late String eventName;
  Box<EventTasks>? eventTaskBox;
  Box<BudgetTasks>? budgetTaskBox;
  List<EventTasks> tasks = [];
  List<BudgetTasks> budgetTaskList = [];
  late String time;
  final actualbudgetController = TextEditingController();
  @override
  void initState() {
    super.initState();
    budgetKey = widget.budget.eventKey;
    eventKey = widget.budget.eventKey;
    eventName = widget.budget.eventName;
    event = widget.budget;
    openHiveBox();
    retrieveData(eventKey);
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
    budgetTaskBox = await Hive.openBox<BudgetTasks>('budgetTask');
  }

  Future<void> retrieveData(String eventKey) async {
    // Retrieve data from eventTaskBox
    tasks = eventTaskBox?.values
            .where((task) => task.eventKey == eventKey)
            .toList() ??
        [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/eventTasks.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      List<EventTasks> newTasks = [];
      lines.forEach((line) {
        final taskData = line.split(',');
        final task = EventTasks(
          eventKey: taskData[0],
          eventName: taskData[1],
          taskKey: taskData[2],
          categoryName: taskData[3],
          taskName: taskData[4],
          vendorName: taskData[5],
          budget: taskData[6],
          isComplete: taskData[7] == 'true',
          taskTimestamp: DateTime.parse(taskData[8]),
        );

        // time = task.timestamp!.toIso8601String();
        time = DateFormat('yyyy-MM-dd').format(task.taskTimestamp).toString();

        tasks.add(task);
        if (task.eventKey == eventKey) {
          newTasks.add(task);
        }
      });
      setState(() {
        tasks = newTasks;
      });
    } else {
      setState(() {
        tasks = [];
      });
    }

    // Update the UI
  }

  @override
  void dispose() {
    eventTaskBox?.close();
    super.dispose();
  }

  bool doesActualBudgetExist(BudgetTasks task) {
    // Check if actual budget is not null and not empty
    return task.actualBudget != null && task.actualBudget.isNotEmpty;
  }

  void _showWarningPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Warning"),
          content: Text(
              "Actual budget already added for this task. Do you want to update it?"),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the warning popup

                // Navigate to the update page here
                // You can pass the taskKey or any other necessary data to the update page
              },
              child: Text("Yes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the warning popup
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  Future<bool> doesActualBudgetExistInPhysicalStorage(EventTasks task) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgetTask.txt');
    final exists = await file.exists();

    if (!exists) {
      return false; // File doesn't exist, so actual budget can't exist either
    }

    final lines = await file.readAsLines();
    final taskKey = task.taskKey;

    return lines.any((line) {
      final taskData = line.split(',');
      final storedTaskKey = taskData[1]; // Assuming taskKey is at index 1

      return taskKey == storedTaskKey &&
          taskData[3].isNotEmpty; // Index 3 is for actualBudget
    });
  }

  void _showBudgetPopup(EventTasks budgettask) {
    bool hasActualBudget =
        budgettask.actualBudget != null && budgettask.actualBudget.isNotEmpty;

    String actualBudget = budgettask.actualBudget ??
        ''; // Initialize with existing value if available
    String budgetTaskKey;
    categoryName = budgettask.categoryName;
    vendorName = budgettask.vendorName;
    taskName = budgettask.taskName;
    budget = budgettask.budget;

    taskKey = Uuid().v4();
     if (budgetTaskList.any((existingTask) => existingTask.budgetKey == budgettask.taskKey)) {
    // Display a warning dialog or take any other action to inform the user
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Warning"),
          content: Text("A budget already exists for this task."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the warning popup
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  } 
      else{
        showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Add Budget",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: actualbudgetController,
                  decoration: InputDecoration(
                      labelText: "Actual Budget",
                      contentPadding: EdgeInsets.only(left: 50)),
                  onChanged: (value) {
                    setState(() {
                      actualBudget =
                          value; // Update actualBudget as the user types
                    });
                  },
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left:
                            30), // Adjust the right margin to control the space
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 18, 140, 126),
                      ),
                      onPressed: () async {
                        // Call addBudgetTask to add/update the task in budgetTaskBox
                        addBudgetTask(
                          categoryName,
                          taskName,
                          vendorName,
                          budget,
                          actualBudget,
                          taskKey,
                        );
                        Navigator.of(context).pop();
                        setState(() {}); // Close the popup
                      },
                      child: Text("Save"),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 60)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 18, 140, 126),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                    child: Text("Cancel"),
                  ),
                ],
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> BudgetTaskList = retriveTask();

    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              // titleSpacing: 2.2,
              // forceMaterialTransparency: false,
              backgroundColor: Color.fromARGB(255, 18, 140, 126),
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text(eventName,
                    style: TextStyle(
                      fontSize: width * 0.07,
                      // fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
              ),
              actions: [],
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              return false;
            },
            child: tasks.isEmpty
                ? Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 20, 24, 26),
                      image: DecorationImage(
                        image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 200),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Images/Task/emptyTask.jpg"),
                        ),
                      ),
                    ))
                : Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 20, 24, 26),
                      image: DecorationImage(
                        image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsetsDirectional.zero,
                      shrinkWrap: false,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        return SizedBox(
                          height: 70.0,
                          child: Container(
                            // color: Color.fromARGB(255, 20, 24, 26),
                            padding: EdgeInsetsDirectional.zero,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white12, width: 0.0
                                        //  Theme.of(context).dividerColor
                                        ))),
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 0, top: 0),
                            // color: Color.fromARGB(255, 20, 24, 26),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  color: Color.fromARGB(255, 20, 24, 26),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),

                                  child: ListTile(
                                    leading: Text(
                                      task.taskName,

                                      //  "${task.timestamp?.minute?.toString()}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    textColor: Colors.white,
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.attach_money,
                                            color: task.actualBudget != null &&
                                                    task.actualBudget.isNotEmpty
                                                ? Colors
                                                    .green // Icon color for tasks with a budget
                                                : Colors
                                                    .grey, // Default icon color
                                          ),
                                          onPressed: () {
                                            // Show the budget popup when the icon is tapped
                                            _showBudgetPopup(task);
                                          },
                                        ),
                                      ],
                                    ),
                                    onTap: () async {},
                                    onLongPress: () async {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            heroTag: Text('BudgetAddedList'),
            onPressed: () async {
              Navigator.pushNamed(context, 'BudgetAddedList',
                  arguments: budgetTaskList);
            },
            backgroundColor: Colors.blueGrey.shade900,
            label: Text(
              ' BudgetAddedList ',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ));
  }

  addBudgetTask(String categoryName, String taskName, String vendorName,
      String budget, String actualBudget, String taskKey) async {
    budgetTaskBox = await Hive.openBox<BudgetTasks>('budgettask');

    actualBudget = actualbudgetController.text;
    String budgetKey = Uuid().v4();

    final budgetTask = BudgetTasks(
      budgetKey: budgetKey,
      taskKey: taskKey,
      taskName: taskName,
      actualBudget: actualBudget,
      budget: budget,
      categoryName: categoryName,
      vendorName: vendorName,
    );

    print(
        "Adding Budget Task: $budgetTask"); // Add this line to print the task being added

    // Store the task in Hive
    await budgetTaskBox!.put(budgetKey, budgetTask);
    storeEventTask(budgetTask);

    budgetTaskList.add(budgetTask);
    actualbudgetController.clear();
  }

  Future<void> storeEventTask(BudgetTasks budgetTasks) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgetTask.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    final formattedTimestamp = budgetTasks.taskTimestamp.toIso8601String();

    final budgetData =
        '${budgetTasks.budgetKey},${budgetTasks.taskKey},${budgetTasks.taskName},${budgetTasks.actualBudget},${budgetTasks.budget},${budgetTasks.vendorName},${budgetTasks.categoryName},$formattedTimestamp\n';
    await file.writeAsString(budgetData, mode: FileMode.append);
  }
}