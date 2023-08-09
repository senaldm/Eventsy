// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:eventsy/Screens/Task/User/bottonNavigationPaint.dart';

class BugetAddingEventList extends StatefulWidget {
  const BugetAddingEventList({super.key});

  @override
  State<BugetAddingEventList> createState() => _BugetAddingEventListState();
}

class _BugetAddingEventListState extends State<BugetAddingEventList> {
  // final List<Task> tasks = [];
  List<String> taskList = [];
  @override
  void dispose() {
    Hive.box('tasks').close();
    super.dispose();
  }

  List<String> retriveTask() {
    final taskBox = Hive.box<Task>('task');
    print(taskBox);
    // Get all the data from the box
    return taskBox.values.map((task) => task.taskName).toList();
  }

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
                      "Newest Event First",
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
                      "Oldest Event First",
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
                      "All Events",
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
                      "Completed Event Only",
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
                      "Pending Events Only",
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

    final List<String> taskList = retriveTask();
    print(taskList);
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            automaticallyImplyLeading: true,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add,),
                  onPressed: () {
                    Navigator.pushNamed(context, 'EventselectionPage');
                  }),
            ],
            flexibleSpace: Center(
              child: Text('Event List',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: width * 0.08,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var taskName in taskList) Text(taskName),
          ],
        ),
      ),
    );
  }

  Widget buildContent(List<Task> task) {
    if (task.isEmpty) {
      return Center(
          child: FloatingActionButton(
              heroTag: 'addTask',
              onPressed: () {
                Navigator.pushNamed(context, 'addEventDetails');
              }));
    } else {
      return Center(
        child: Text('UnderDeveloped'),
      );
    }
  }
}
