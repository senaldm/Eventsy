import 'package:flutter/material.dart';

class TaskFilter extends StatefulWidget {
  // const TaskFilter({super.key});

  @override
  State<TaskFilter> createState() => TaskFilterState();

  
}

class TaskFilterState extends State<TaskFilter> {
  String filter = 'all';

  @override
  Widget build(BuildContext context) {
    return filterTask();
  }

  filterTask() {
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
}
