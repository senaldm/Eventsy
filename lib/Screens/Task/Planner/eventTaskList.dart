// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/Event.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class EventTaskList extends StatefulWidget {
  final Event event;
  const EventTaskList({required this.event});
  @override
  _EventTaskListState createState() => _EventTaskListState();
}

class _EventTaskListState extends State<EventTaskList> {
  late Event event;
  late String eventKey;
  late String eventName;
  Box<EventTasks>? eventTaskBox;
  List<EventTasks> tasks = [];
  List<EventTasks> originalTasks = [];
  late String time;

  @override
  void initState() {
    super.initState();
    eventKey = widget.event.eventKey;
    eventName = widget.event.eventName;
    event = widget.event;
    openHiveBox();
    retrieveData(eventKey);
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
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
        if (taskData[0] == eventKey) {
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
          time = DateFormat('yyyy-MM-dd').format(task.taskTimestamp).toString();

          if (task.eventKey == eventKey) {
            print(task.taskName);
            tasks.add(task);
            newTasks.add(task);
          }
        }

        // time = task.timestamp!.toIso8601String();
      });
      setState(() {
        tasks = newTasks;
        originalTasks = newTasks.toList();
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

  String sort = 'accentOrder';
  String filter = 'all';

  List<EventTasks>? sortTaskByMethod(String method) {
    setState(() {
      if (method == 'accent') {
        return tasks.sort((a, b) => a.taskName.compareTo(b.taskName));
      } else if (method == 'deaccent') {
        return tasks.sort((a, b) => b.taskName.compareTo(a.taskName));
      } else if (method == 'newestFirst') {
        return tasks.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
      } else if (method == 'oldestFirst') {
        return tasks.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      }
    });
    return null;
  }

  void filterTasksByMethod(String method) {
    setState(() {
      // tasks = newTasks;
      if (method == 'completed') {
        tasks = originalTasks.where((task) => task.isComplete).toList();
      } else if (method == 'pending') {
        // tasks = newTasks;
        tasks = originalTasks.where((task) => !task.isComplete).toList();
      } else {
        // Reset the tasks list to show all tasks
        retrieveData(eventKey);
      }
      // tasks = newTasks;
    });
  }

//////////////////////sort Task ////////////////////////////////////////////
////////////////////////////////////////////////////////////////
///////////////////////////////////////////////

  void sortTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "\u2B07 A-Z",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "accent",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortTaskByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "\u2B06 Z-A",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "deaccent",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortTaskByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    selected: true,
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
                        sortTaskByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Oldest Task First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "oldestFirst",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortTaskByMethod(sort);
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

  filterTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
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

                        filterTasksByMethod(filter);
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
                        filterTasksByMethod(filter);
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
                        filterTasksByMethod(filter);
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

  /////////////////////deleteTask//////////////////////////
  ///////////////////////////////////////////////
  /////////////////////////////////////////////////////

  static Future<void> deleteTask(String taskKey) async {
    final eventTaskBox = await Hive.openBox<EventTasks>('eventTask');

    if (eventTaskBox.containsKey(taskKey)) {
      eventTaskBox.delete(taskKey);
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/eventTasks.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final taskData = line.split(',');
        final taskKeyInFile = taskData[0];
        return taskKeyInFile != taskKey;
      }).toList();

      await file.writeAsString(updatedLines.join('\n'));
    }
  }

  // ////////////////////Edit or delete////////////////////////////
  /////////////////////////////////////////////////////////

  editOrDelete(String key) {
    // String taskKey = key;
    String taskKey = key;

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
                          arguments: taskKey);
                      retrieveData(eventKey);
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
                      await deleteTask(taskKey);
                      // retrieveData(eventKey);
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

//////////////////main view///////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
  ///
  // var tasks = eventTaskBox.values.toList();

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> EventTaskList = retriveTask();

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
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/viewEvent',
                          arguments: event);
                    },
                    icon: Icon(Icons.info_outline))
              ],
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              await Navigator.pushNamed(context, '/EventList');
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
                                    trailing: Text(
                                      time,
                                    ),
                                    onTap: () async {
                                      Navigator.pushNamed(
                                          context, '/viewEventTask',
                                          arguments: {
                                            'task': task,
                                            'event': event
                                          });
                                      // setState(() {
                                      //   retrieveData();
                                      // });
                                    },
                                    onLongPress: () async {
                                      final updatedTask =
                                          editOrDelete(task.taskKey);
                                      if (updatedTask != null) {
                                        setState(() {
                                          retrieveData(eventKey);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(width: 3, color: Colors.white),
            //   borderRadius: BorderRadius.circular(100)),
            onPressed: () async {
              // Navigator.pushNamed(context, 'addTask');
              final newTask = await Navigator.pushNamed(
                  context, '/addEventTask',
                  arguments: {
                    'eventName': event.eventName,
                    'eventKey': event.eventKey,
                    'event': event,
                  });
              if (newTask != null) {
                // If a new task is added, update the data and refresh the UI
                setState(() {
                  tasks.add(newTask as EventTasks);
                });
              }
              await retrieveData(eventKey);
            },
            child: Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            //to add curve margin around floating action button . use notcMargin. default is 4
            notchMargin: 4,

            clipBehavior: Clip.antiAlias,

            // use about attribute to get the curve shape for notchMargin
            shape: CircularNotchedRectangle(),
            // ← carves notch for FAB in BottomAppBar
            color: Color.fromARGB(255, 18, 140, 126),
            //  Theme.of(context).primaryColor.withAlpha(0),

            // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
            elevation:
                8, // ← removes slight shadow under FAB, hardly noticeable
            // ↑ default elevation is 8. Peek it by setting color ↑ alpha to 0
            child: BottomNavigationBar(
              // ***** NAVBAR  *************************
              elevation: 1, // 0 removes ugly rectangular NavBar shadow
              // CRITICAL ↓ a solid color here destroys FAB notch. Use alpha 0!
              backgroundColor: Color.fromARGB(255, 18, 140, 126),
              // Theme.of(context).primaryColor.withAlpha(0),
              // ====================== END OF INTERESTING STUFF =================
              selectedItemColor: Theme.of(context).colorScheme.onSurface,

              onTap: (int index) {
                setState(() {
                  if (index == 0) {
                    sortTask();
                  } else if (index == 1) {
                    filterTask(context);
                  }
                });
              },

              items: [
                BottomNavigationBarItem(

                    // backgroundColor: Colors.black,
                    icon: Icon(
                      Icons.sort,
                      size: 40,
                      color: Colors.black,
                      //  Theme.of(context).colorScheme.onBackground
                    ),
                    label: 'Sort'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.filter_alt,
                      size: 40,
                      color: Colors.black,
                      // Theme.of(context).colorScheme.onBackground
                    ),
                    label: 'Filter')
              ],
            ),
          )),
    );
  }
}