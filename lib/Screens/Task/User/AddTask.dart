// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:eventsy/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
// import 'package:eventsy/main.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskController = TextEditingController();
  final vendorController = TextEditingController();
  // final categoryController = TextEditingController();
  final budgetController = TextEditingController();
  final statusController = TextEditingController();
  String taskName = '';
  String categoryName = '';
  String vendorName = '';
  String budget = '';
  bool isComplete = false;

  final String label = "Task Completed";
  bool isSwitchOn = false;

  final bool value = false;
  final bool onChanged = true;
  final _formKey = GlobalKey<FormState>();
  final List<Task> task = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        // ignore: sort_child_properties_last
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: Color.fromARGB(255, 18, 140, 126),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.1),

              // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

              child: AppBar(
                titleSpacing: 2.2,
                forceMaterialTransparency: false,
                backgroundColor: Color.fromARGB(255, 18, 140, 126),
                automaticallyImplyLeading: true,
                centerTitle: true,
                flexibleSpace: Center(
                  child: Text(
                    'Task List',
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontFamily: 'Roboto',
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.only(
                            left: width * 0.15, right: width * 0.15),

                        borderOnForeground: false,
                        // child:SingleChildScrollView(
                        child: DropdownButtonFormField<String>(
                          onChanged: (String? newValue) {
                            setState(() {
                              categoryName = newValue!;
                            });
                          },

                          items: <String>[
                            'Decoration',
                            'Food and Beverages',
                            'Option 3',
                            'Option 4',
                            'Option 5',
                            'Decorations',
                            'Food and Beveragess',
                            'Option 3s',
                            'Option 4s',
                            'Option 5s',
                            'Decorationy',
                            'Food and Beveragesy',
                            'Option 3y',
                            'Option 4y',
                            'Option 5y',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(
                                width: 290,
                                height: 60,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                         
                          style: const TextStyle(
                            color: Colors.black87,
                            // fontSize: 20.0,
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Add Category',
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade900,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              
                            ),
                            prefixIcon: Icon(Icons.category_outlined,),
                            hintText: 'Category',
                          ),
                          focusColor: Colors.black87,
                          dropdownColor: Colors.blueGrey.shade900,
                        ),
                      ),

                      // SizedBox(
                      //   height: width * 0.05,
                      // ),
                    
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.only(
                            left: width * 0.15, right: width * 0.15),
                        borderOnForeground: false,
                        child: Hero(
                          tag: 'taskName',
                          child: TextFormField(
                            controller: taskController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a task name";
                              }
                              return null;
                            },
                            //   validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter a task name';
                            //   }
                            //   return null;

                            // },

                            decoration: InputDecoration(
                               border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                              prefixIcon:Icon(Icons.task_outlined),
                            
                              hintText: 'Task Name',
                              // prefixText:'Task Name',
                              // prefixIconColor:Colors.green,
                              
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.only(
                            left: width * 0.15, right: width * 0.15),
                        borderOnForeground: false,
                        child: Hero(
                          tag: 'vendorName',
                          child: TextField(
                            controller: vendorController,
                            // onChanged: (value) {
                            //   vendorName:
                            //   value;
                            // },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                                  prefixIcon: Icon(Icons.business_center_outlined),
                              hintText: 'Vendor Name',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.only(
                            left: width * 0.15, right: width * 0.15),
                        borderOnForeground: false,
                        child: Hero(
                          tag: 'budget',
                          child: TextField(
                            controller: budgetController,
                            // onChanged: (value) {
                            //   budget:
                            //   value;
                            // },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                                  prefixIcon: Icon(Icons.attach_money_rounded),
                              hintText: ' Budget ',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: width * 0.05,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: label,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SlidingSwitch(
                            value: false,
                            width: 100,
                            height: 50,
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                            iconOff: Icons.cancel_rounded,
                            iconOn: Icons.done,
                            contentSize: 24,
                            colorOn: Color.fromARGB(255, 10, 224, 17),
                            colorOff: Color.fromARGB(255, 126, 19, 11),
                            background: Colors.black87,
                            buttonColor: const Color(0xfff7f5f7),
                            inactiveColor: const Color(0xff636f7b),
                            onChanged: (bool newValue) {
                              setState(() {
                                isSwitchOn = newValue;
                              });
                            },
                          ),
                        ],
                      )
                      //
                    ]),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Color.fromARGB(255, 18, 140, 126),
                height: 90,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton.extended(
                        heroTag: Text('cancel'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/TaskList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      FloatingActionButton.extended(
                        heroTag: Text('save'),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            await addTask(
                              categoryName,
                              taskController.text,
                              vendorController.text,
                              budgetController.text,
                              isComplete,
                            );
                            Navigator.pop(context);
                          }
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Save ',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  void doNothing() {}

  bool isFormValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  bool isFilled = false;
  void setValidator(valid) {
    setState(() {
      isFilled = valid;
    });
  }

  addTask(String categoryName, String taskName, String vendorName,
      String budget, bool isComplete) async {
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final filePath = '${appDocumentDir.path}/tasks.txt';
    taskBox = await Hive.openBox<Task>('task');

    if (_formKey.currentState!.validate()) {
      categoryName = categoryName;
      // categoryName = categoryController.text;
      taskName = taskController.text;
      vendorName = vendorController.text;
      budget = budgetController.text;
      isComplete = isSwitchOn;
      final String uniqueKey = Uuid().v4();

      // Create a new Task object
      final task = Task(
          taskKey: uniqueKey,
          categoryName: categoryName,
          taskName: taskName,
          vendorName: vendorName,
          budget: budget,
          isComplete: isComplete,
          timestamp: DateTime.now());

      // Store the task in Hive
      await taskBox.put(uniqueKey, task);
      storeTask(task);

      // Clear form data
      // categoryController.clear();
      taskController.clear();
      vendorController.clear();
      budgetController.clear();
    }
  }

  Future<void> storeTask(Task task) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/tasks.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }
    

    final formattedTimestamp = task.timestamp?.toIso8601String() ?? '';

    final taskData =
        '${task.taskKey},${task.categoryName},${task.taskName},${task.vendorName},${task.budget},${task.isComplete},$formattedTimestamp\n';
    await file.writeAsString(taskData, mode: FileMode.append);
  }
}
