// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:eventsy/Model/Events/Task.dart';
import 'package:eventsy/boxes.dart';

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
              child: Text(
                'Task List',
                style: TextStyle(
                    fontSize: width * 0.08,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        body: ValueListenableBuilder<Box<Task>>(
            valueListenable: Boxes.getTask().listenable(),
            builder: (context, box, _) {
              final tasks = box.values.toList().cast<Task>();

              return buildContent(tasks);
            }),
      ),
    );
  }

  Widget buildContent(List<Task> task) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (task.isEmpty) {
    
      return Center(
      
          child: FloatingActionButton(onPressed: (){Navigator.pushNamed(context,'/addTask');}
      //     child:Icon(Icons.add))
      //     Image.asset(
      //   "assets/Images/Home/task.png",
      //   height: height * 0.2,
      // ),
      
    
          )
      );
    } else {
      return Center(
        child: Text('UnderDeveloped'),
      );
    }
  }

  void addTasks(
      String taskName, String vendorName, double budget, bool isComplete) {
    final task = Task()
      ..taskName = taskName
      ..vendorName = vendorName
      ..budget = budget
      ..isComplete = isComplete;

    final box = Boxes.getTask();
    box.add(task);
  }
}
