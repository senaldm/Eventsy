// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventsy/Screens/Home/home.dart';
import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:eventsy/Screens/Task/User/bottonNavigationPaint.dart';
import 'package:eventsy/main.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {

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
                              Navigator.pushNamed(context, 'addEventDetails');
                            },
                            child: Icon(Icons.add_task_sharp),
                            style: ElevatedButton.styleFrom(
                                // alignment:,
                                backgroundColor: Colors.green.shade900,
                                shape: CircleBorder(),
                                fixedSize: Size(width * 0.18, width * 0.18),
                                padding: EdgeInsets.all(24),
                                side: BorderSide(
                                    color: Colors.white70,
                                    width: width * 0.008)
                                    ),
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
                  Navigator.pushNamed(context, 'addEventDetails');
                }
                )
                );
      } else {
        return Center(
          child: Text('UnderDeveloped'),
        );
      }
    }
  }

