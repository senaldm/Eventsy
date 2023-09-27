// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/Event.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class BudgedAddedList extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  final String budgetKey = '';
  final List<BudgetTasks> budgetList;
  BudgedAddedList({Key? key, required this.budgetList}) : super(key: key);

  @override
  _BudgedAddedListState createState() => _BudgedAddedListState();
}

class _BudgedAddedListState extends State<BudgedAddedList> {
  late List<BudgetTasks> budgetlist;
  late final String budgetKey;
  Box<BudgetTasks>? budgetTaskBox;
  List<BudgetTasks> budgetTasks = [];
  List<BudgetTasks> originalBudgetTasks = [];

  get height => null;

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    budgetTaskBox = await Hive.openBox<BudgetTasks>('budgettask');
  }

  Future<void> retrieveData(String budgetKey) async {
    // Retrieve data from eventTaskBox
    budgetTasks = budgetTaskBox?.values
            .where((budgetTask) => budgetTask.budgetKey == budgetKey)
            .toList() ??
        [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgetTask.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      List<BudgetTasks> newTasks = [];
      lines.forEach((line) {
        final budgetData = line.split(',');
        final budgettask = BudgetTasks(
          taskKey: budgetData[2],
          taskName: budgetData[4],
          actualBudget: budgetData[8],
          budgetKey: budgetData[9],
          budget: budgetData[6],
          categoryName: budgetData[3],
          vendorName: budgetData[5],
        );
        
        newTasks.add(budgettask);
      });

      setState(() {
        budgetTasks = newTasks;
        originalBudgetTasks = newTasks.toList();
      });
    } else {
      setState(() {
        budgetTasks = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Make sure that budgetKey is correctly passed or fetched
    budgetKey =
        widget.budgetList.isNotEmpty ? widget.budgetList[0].budgetKey : '';
    budgetlist = widget.budgetList;
    openHiveBox();
    retrieveData(budgetKey);
  }

  @override
  void dispose() {
    budgetTaskBox?.close();
    super.dispose();
  }

  /////////////////////deleteTask//////////////////////////
  ///////////////////////////////////////////////
  /////////////////////////////////////////////////////

  static Future<void> deleteTask(String budgetKey) async {
    final bugetTaskBox = await Hive.openBox<BudgetTasks>('budgettasks');

    if (bugetTaskBox.containsKey(budgetKey)) {
      bugetTaskBox.delete(budgetKey);
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgetTask.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final budgetData = line.split(',');
        final taskKeyInFile = budgetData[0];
        return taskKeyInFile != budgetKey;
      }).toList();

      await file.writeAsString(updatedLines.join('\n'));
    }
  }

  // ////////////////////Edit or delete////////////////////////////
  /////////////////////////////////////////////////////////

  editOrDelete(String key) {
    // String taskKey = key;
    String budgetKey = key;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final updatedTask = await Navigator.pushNamed(
                          context, '/updateTask',
                          arguments: budgetKey);
                      retrieveData(budgetKey);
                      // if (updatedTask != null) {
                      //   // If a new task is added, update the data and refresh the UI
                      //   setState(() {
                      //     tasks.add(updatedTask as Task);
                      //   });
                      // }

                      Navigator.pop(context, updatedTask);
                      // Navigator.pushNamed(context,'UserHome');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 37, 211, 102),
                    ),
                    child: Text(" Edit ",
                        style: TextStyle(
                          color: Colors.black87,
                        ))),
                ElevatedButton(
                    onPressed: () async {
                      await deleteTask(budgetKey);
                      retrieveData(budgetKey);
                      Navigator.pop(context, null);
                      // deleteTask(taskKey);
                      // Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      // alignment:,
                      backgroundColor: Color.fromARGB(255, 118, 6, 6),
                    ),
                    child: Text("Delete",
                        style: TextStyle(
                          color: Colors.black87,
                        ))),
              ],
            ),
          );
        });
    //return action;
  }

  BudgetTasks? getTaskDetails(String budgetKey) {
    return budgetTasks.firstWhere(
      (budget) => budget.budgetKey == budgetKey,
    );
  }

  void showDetails(String budgetKey) {
    final taskDetails = getTaskDetails(budgetKey);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var width;
          return Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                  AlertDialog(
                    backgroundColor: Color.fromARGB(255, 18, 140, 126),
                    title: const Text(
                      'Tasks  Details',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    content: Container(
                      width: width * 0.8,
                      height: height * 0.45,
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.only(
                                top: width * 0.05, bottom: width * 0.05),
                            borderOnForeground: false,
                            child: Hero(
                              tag: 'Task Name',
                              child: SizedBox(
                                width: width * 1.5,
                                height: height * 0.08,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.category_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      ' ${taskDetails?.taskName ?? ''}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Rest of the code remains the same.
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.only(
                                top: width * 0.05, bottom: width * 0.05),
                            borderOnForeground: false,
                            child: Hero(
                              tag: 'Target Budget',
                              child: SizedBox(
                                width: width * 1.5,
                                height: height * 0.08,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.task_outlined,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      '${taskDetails?.budget ?? ''}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: EdgeInsets.only(
                                top: width * 0.05, bottom: width * 0.05),
                            borderOnForeground: false,
                            child: Hero(
                              tag: 'Actual Budget',
                              child: SizedBox(
                                width: width * 1.5,
                                height: height * 0.08,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.attach_money_rounded,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      '${taskDetails?.actualBudget ?? ''}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.05,
                                  width: width * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 7, 94, 84),
                                    ),
                                    child: const Text(
                                      "Done",
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )

                          // Rest of the code remains the same.
                        ],
                      ),
                    ),
                  ),
                ])),
          );
        });
  }
//////////////////main view///////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
  ///
  // var tasks = eventTaskBox.values.toList();

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final budgetList =
        ModalRoute.of(context)?.settings.arguments as List<BudgetTasks>;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> BudgedAddedList = retriveTask();

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
              child: Text('Budget Added Task List',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    // fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  )),
            ),
           
          ),
        ),
        body: budgetTasks.isEmpty
            ? Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 20, 24, 26),
                  image: DecorationImage(
                    image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
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
                  itemCount: originalBudgetTasks.length,
                  itemBuilder: (context, index) {
                    final budget = originalBudgetTasks[index];

                    return SizedBox(
                      height: 70.0,
                      child: Container(
                        // color: Color.fromARGB(255, 20, 24, 26),
                        padding: EdgeInsetsDirectional.zero,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.white12, width: 0.0
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
                                  budget.taskName,

                                  //  "${task.timestamp?.minute?.toString()}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                textColor: Colors.white,
                                onTap: () async {
                                  Navigator.pushNamed(context, 'VeiwBudgetTask',
                                      arguments: budget);

                                  // setState(() {
                                  //   retrieveData();
                                  // });
                                },
                                onLongPress: () async {
                                  final updatedTask =
                                      editOrDelete(budget.taskKey);
                                  if (updatedTask != null) {
                                    // If a new task is added, update the data and refresh the UI
                                    setState(() {
                                      retrieveData(budgetKey);
                                    });
                                  }
                                  // await retrieveData();
                                },
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
    );
  }
}
