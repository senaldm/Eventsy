// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:eventsy/Model/Event.dart';
import 'package:eventsy/Screens/Task/User/deleteTask.dart';
import 'package:flutter/material.dart';
class ViewTask extends StatefulWidget {
  final Task task;
  const ViewTask({required this.task});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  late Task currentTask;
  @override
  void initState() {
    super.initState();
    currentTask = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            title: Text(
              currentTask.taskName,
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  DeleteTask.deleteTask(currentTask.taskKey);

                  Navigator.pushNamed(context, 'TaskList');
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () async {
                  final updatedTask = await Navigator.pushNamed(
                      context, '/updateTask',
                      arguments: currentTask.taskKey);
                  if (updatedTask != null) {
                    // ignore: use_build_context_synchronously
                    currentTask = updatedTask as Task;
                  }
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
              child: Container(
                // color: Color.fromARGB(255, 20, 24, 26),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 20, 29, 32),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3.0,
                    color: const Color.fromARGB(179, 156, 154, 154),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Task Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      iconColor: Colors.white70,
                      textColor: Colors.white,
                      leading: Icon(Icons.assignment),
                      title: Text('Task Name'),
                      subtitle: Text(currentTask.taskName),
                    ),
                    ListTile(
                      iconColor: Colors.white70,
                      textColor: Colors.white,
                      leading: Icon(Icons.store),
                      title: Text('Vendor Name'),
                      subtitle: Text(currentTask.vendorName),
                    ),
                    ListTile(
                      iconColor: Colors.white70,
                      textColor: Colors.white,
                      leading: Icon(Icons.attach_money),
                      title: Text('Budget'),
                      subtitle: Text(currentTask.budget),
                    ),
                    ListTile(
                      iconColor: Colors.white70,
                      textColor: Colors.white,
                      leading: Icon(Icons.check),
                      title: Text('Is Complete'),
                      subtitle: Text(currentTask.isComplete ? 'Yes' : 'No'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 18, 140, 126),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _markAsCompleted() {
    // Update the currentTask's isComplete property
    currentTask.isComplete = true;

    // Notify the userDashboard that a task is completed
    Navigator.pop(context, true); // Pass 'true' as a result
  }
}
