// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:eventsy/Model/Event.dart';
import 'package:eventsy/Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/deletebudgettask.dart';
import 'package:flutter/material.dart';

class ViewBudgetTasks extends StatelessWidget with DeleteTask {
  final BudgetTasks budget;
  const ViewBudgetTasks({
    required this.budget,
  });

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
              budget.taskName,
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  DeleteTask.deleteTask(budget.budgetKey);

                  Navigator.popUntil(
                      context, ModalRoute.withName('BudgetAddedList'));
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () async {
                  final updatedTask = await Navigator.pushNamed(
                      context, 'UpdateBudgetTask',
                      arguments: budget);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, updatedTask);
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.popUntil(context, ModalRoute.withName('BudgetAddedList'));
            return false;
          },
          child: Container(
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
                        subtitle: Text(budget.taskName),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.store),
                        title: Text('Vendor Name'),
                        subtitle: Text(budget.vendorName),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.attach_money),
                        title: Text('Target Budget'),
                        subtitle: Text(budget.budget),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.check),
                        title: Text('Actual Budget'),
                        subtitle: Text(budget.actualBudget),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 18, 140, 126),
                        ),
                        onPressed: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('BudgetAddedList'));
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
      ),
    );
  }
}
