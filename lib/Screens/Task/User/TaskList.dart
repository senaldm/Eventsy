// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventsy/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';

import 'package:eventsy/Model/Events/Task.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:eventsy/Screens/Task/User/bottonNavigationPaint.dart';

class TaskList extends StatefulWidget {
  // const TaskList({ Key? key }) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Task> tasks = [];
  @override
  void dispose() {
    Hive.box('taks').close();
    super.dispose();
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
                child: Text('Task List',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          body: Container(),
          // ValueListenableBuilder<Box<Task>>(
          //     valueListenable: Boxes.getTask().listenable(),
          //     builder: (context, box, _) {
          //       final tasks = box.values.toList().cast<Task>();

          //       return buildContent(tasks);
          //     }),
          bottomNavigationBar: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: height * 0.11,
                  width: width,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white70)),
                  // padding:  EdgeInsets.only(top: height*0.1),
                  child: CustomPaint(
                      painter: ProfileCardPainter(
                        color: Colors.green.shade900,
                        avatarRadius: 20,
                      ), //3
                      child: Container(
                        decoration: ShapeDecoration(
                          // color: Colors.white,
                          shape: Border.all(
                              color: Colors.white70,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                      )),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: height*0.1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/addTask');
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
                                    width: width * 0.008)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                              onPressed: () {}, label: Text("dfgf")),
                          FloatingActionButton.extended(
                              onPressed: () {}, label: Text("dfgf"))
                        ],
                      )
                    ]),
                SizedBox(
                  height: height * 0.2,
                ),
              ])
         
          ),
    );
  }

  Widget buildContent(List<Task> task) {
    if (task.isEmpty) {
      return Center(child: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/addTask');
      }

          ));
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
}
