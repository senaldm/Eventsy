// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:eventsy/Model/Event.dart';

import 'package:eventsy/Screens/Task/User/bottonNavigationPaint.dart';


import 'package:path_provider/path_provider.dart';
import 'dart:io';

class TaskList extends StatefulWidget {
  // const TaskList({ Key? key }) : super(key: key);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Box<Task>? taskBox;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    openHiveBox();
    retrieveData();
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    taskBox = await Hive.openBox<Task>('task');
  }

  Future<void> retrieveData() async {
    // Retrieve data from Hive box
    tasks = taskBox?.values.toList() ?? [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/tasks.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      lines.forEach((line) {
        final data = line.split(',');
        final task = Task(
          categoryName: data[0],
          taskName: data[1],
          vendorName: data[2],
          budget: data[3],
          isComplete: data[4] == 'true',
        );
        tasks.add(task);
        
      });
    }

    setState(() {}); // Update the UI
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  // final List<Task> tasks = [];
  // List<String> taskList = [];
  // @override
  // void dispose() {
  //   Hive.box('tasks').close();
  //   super.dispose();
  // }

  // List<String> retriveTask() {
  //   final taskBox = Hive.box<Task>('task');
  //   print(taskBox);
  //   // Get all the data from the box
  //   return taskBox.values.map((task) => task.taskName).toList();

  // @override
  // Widget build(BuildContext context) {
  //     final height = MediaQuery.of(context).size.height;
  // final width = MediaQuery.of(context).size.width;
  //   return    Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //         for (var task in tasks)
  //             Card(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0)),
  //                 margin: EdgeInsets.only(
  //                     left: width * 0.15, right: width * 0.15),
  //                 borderOnForeground: false,
  //                 child: TextButton(
  //                     onPressed: () {}, child: Text(task.taskName))),
  //         ],
  //       );
  // }
  // }

  String sort = 'accentOrder';
  String filter = 'all';

//////////////////////sort Task ////////////////////////////////////////////
////////////////////////////////////////////////////////////////
///////////////////////////////////////////////
  void sortTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green.shade900,
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "Accent Order",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "accent",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Deaccent Order",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "deaccent",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Newest Task First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "newestFirst",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Olderst Task First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "olderstFirrst",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

// Filter function
/////////////////////////Filter Task//////////////////////////////
/////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
  void filterTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green.shade900,
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "All Tasks",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "all",
                    groupValue: filter,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        filter = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Completed Task Only",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "completed",
                    activeColor: Colors.black87,
                    groupValue: filter,
                    onChanged: (value) {
                      setState(() {
                        filter = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Pending Task Only",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "pending",
                    activeColor: Colors.black87,
                    groupValue: filter,
                    onChanged: (value) {
                      setState(() {
                        filter = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

//////////////////main view///////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
  ///

  // var tasks = taskBox.values.toList();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // final List<String> taskList = retriveTask();
    // print(taskList);
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
           backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor: Colors.greenAccent.shade700,
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Task List',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          body:
          //  Container(

          //     // color: Colors.white,
          //     width: width*0.8,
          //     height:height*0.2,
              
          //     decoration: BoxDecoration(
          //       color:Colors.white,
          //     ),
          //     child:Text("sfd",style: TextStyle(color:Colors.red),)
          // ),
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              print(task.taskName);
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: ListTile(
                  
                  title: Text(task.taskName),
                  
                  // subtitle: Text(task.categoryName),
                  onTap: () {
                    // Handle task item tap
                  },
                ),
              );
            },
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [

          //     // taskList = retriveTask(),
          //   //   for (var taskName in taskList)
          //   //  Text(taskName),
          //       Card(
          //         color: Colors.white,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10.0)),
          //           margin: EdgeInsets.only(
          //               left: width * 0.15, right: width * 0.15),
          //           borderOnForeground: false,
          //           child: TextButton(onPressed: () {}, child: Text(
          //             taskName,style: TextStyle(color: Colors.black)

          //           ))),
          //   ],
          // ),
          // retriveTask(),
          // FutureBuilder<Widget>(
          //   future: retriveTask(),
          //   builder: (context, snapshot) {

          //     if (snapshot.hasData) {
          //       return snapshot.data;
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },

          //         Container(
          //   child: ListView.builder(
          //     itemCount: tasks.length,
          //     itemBuilder: (context, index) {
          //       final task = tasks[index];
          //       return Card(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //         margin: EdgeInsets.only(
          //           left: width * 0.15,
          //           right: width * 0.15,
          //         ),
          //         borderOnForeground: false,
          //         child: TextButton(
          //           onPressed: () {},
          //           child: Text(task.taskName),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          bottomNavigationBar:
              Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            Container(
              height: height * 0.11,
              width: width,
              child: CustomPaint(
                  painter: ProfileCardPainter(
                    color: Colors.green.shade900,
                    avatarRadius: 30,
                  ), //3
                  child: Container(
                    decoration: BoxDecoration(
                        //  color: Colors.white,
                        border: Border.all(
                            color: Colors.white70, width: width * 0.008),
                        borderRadius: BorderRadius.circular(10.0)),
                  )),
            ),
            Container(

                // alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: height * 0.8),
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: height * 0.145,
                        // ),
                        FloatingActionButton.extended(
                          heroTag: 'sort',
                          onPressed: () {
                            sortTask();
                          },
                          icon: Icon(Icons.sort),
                          label: Text(
                            " Sort ",
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                          backgroundColor: Colors.black54,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: height*0.2),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'addTask');
                          },
                          child: Icon(Icons.add_task_sharp),
                          style: ElevatedButton.styleFrom(
                              // alignment:,
                              backgroundColor: Colors.green.shade900,
                              shape: CircleBorder(),
                              fixedSize: Size(width * 0.18, width * 0.18),
                              padding: EdgeInsets.all(24),
                              side: BorderSide(
                                  color: Colors.white70, width: width * 0.008)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: height * 0.1,
                        // ),
                        FloatingActionButton.extended(
                          heroTag: 'filter',
                          onPressed: () {
                            filterTask();
                          },
                          icon: Icon(Icons.filter_alt_sharp),
                          label: Text(
                            " Filter ",
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                          backgroundColor: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                )),
          ])),
    );
  }

  Widget buildContent(List<Task> task) {
    if (task.isEmpty) {
      return Center(
          child: FloatingActionButton(
              heroTag: 'addTask',
              onPressed: () {
                Navigator.pushNamed(context, '/addTask');
              }));
    } else {
      return Center(
        child: Text('UnderDeveloped'),
      );
    }
  }

  // void addTasks(
  //     String taskName, String vendorName, double budget, bool isComplete) {
  //   final task = Task()
  //     ..taskName = taskName
  //     ..vendorName = vendorName
  //     ..budget = budget
  //     ..isComplete = isComplete;

  //   final box = Boxes.getTask();
  //   box.add(task);
  // }
  //  void TaskList() {
  //    final taskList = taskBox.values.toList();
  //   setState(() {
  //     //  tasks.clear();
  //     // tasks.addAll(tasks);
  //   });
  // }
}

// class Task {
//   String taskName;

//   Task(this.taskName);
// }

// class TaskWrapper {
//   Task task;

//   TaskWrapper(this.task);
// }


// class RetriveTask extends StatefulWidget {
//   const RetriveTask({super.key});

//   @override
//   State<RetriveTask> createState() => _RetriveTaskState();
// }

// class _RetriveTaskState extends State<RetriveTask> {
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // openBox();
//   //   retrieveTasks();
//   // }


//   Future<List<TaskWrapper>> retrieveTasks() async {
//     await Hive.openBox<Task>('task');
// Box<TaskWrapper> taskBox = Hive.box('tasks');
//     return  taskBox.values.toList();
//     // Update your tasks list or perform any other logic

//     // return tasks;
//   }

  

//   @override
//   void dispose() {
//     Hive.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var tasks= retrieveTasks();
    
    
//     return ListView.builder(
//       itemCount: taskBox.length,
//       itemBuilder: (context, index) {
//         final task = taskBox[index] as TaskWrapper;
//         return ListTile(
//           title: Text(task.task.taskName),
//         );
//       },
//     );
//   }
// }
