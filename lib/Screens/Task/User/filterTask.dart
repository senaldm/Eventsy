import 'package:flutter/material.dart';

class filterTasks extends StatefulWidget {
  const filterTasks({super.key});

  @override
  State<filterTasks> createState() => _filterTasksState();
}

class _filterTasksState extends State<filterTasks> {
  @override
  Widget build(BuildContext context) {
    return filterTasks();
  }
  String filter = 'all';
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
