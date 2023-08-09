// // ignore_for_file: prefer_const_constructors

// import 'dart:io';
// import 'dart:math';

// import 'package:eventsy/global.dart';
// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:eventsy/Model/Event.dart';
// import 'package:hive/hive.dart';
// import 'package:uuid/uuid.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:convert';
// // import 'package:eventsy/main.dart';

// class UpdateBudgetTask extends StatefulWidget {
//   final String Key;
// // final Function(Task updatedTask) onUpdate;
//   UpdateBudgetTask({
//     required this.Key,
//   });

//   @override
//   _UpdateBudgetTaskState createState() => _UpdateBudgetTaskState();
// }

// class _UpdateBudgetTaskState extends State<UpdateBudgetTask> {
//   late String taskbudgetKey;
//   String? eventKey;
//   String? eventName;
//   String? targetBudget;
//   final eventtaskController = TextEditingController();
//   final vendorNameController = TextEditingController();
//   // final categoryController = TextEditingController();
//   final totalPriceController = TextEditingController();
//   // String taskName = '';
//   // String categoryName = 'Decoration';
//   // String vendorName = '';
//   // String budget = '';

//   late String categoryName;

//   final _formKey = GlobalKey<FormState>();

//   Box<BudgetEvent>? taskbudgetBox;
//   List budgettaskDetails = [];

//   @override
//   void initState() {
//     super.initState();
//     taskbudgetKey = widget.Key;
//     openHiveBox();

//     eventtaskController.text = '';
//     vendorNameController.text = '';
//     totalPriceController.text = '';
//     categoryName = 'Decoration';
//     // isSwitchOn = false;
//     fillFormFields();
//   }

//   Future<void> openHiveBox() async {
//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocumentDir.path);
//     taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');
//   }

//   Future<void> fillFormFields() async {
//     BudgetEvent? task = taskbudgetBox?.get(taskbudgetKey);
//     task ??= await getTaskFromLocalStorage(taskbudgetKey);
//     if (task != null) {
//       setState(() {
//         eventtaskController.text = task!.categoryName;
//         vendorNameController.text = task.vendorName;
//         totalPriceController.text = task.totalPrice;
//       });
//       if (eventtaskController.text != '') {
//         print(categoryName);
//         print(task.taskeventKey);
//         print(task.vendorName);
//       } else {
//         print('task is empty');
//       }
//     }
//   }

//   Future<BudgetEvent?> getTaskFromLocalStorage(String taskKey) async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/budgettask.txt');

//       if (await file.exists()) {
//         final lines = await file.readAsLines();
//         for (final line in lines) {
//           final taskData = line.split(',');
//           if (taskData[0] == taskKey) {
//             final task = BudgetEvent(
//               taskeventKey: taskData[0],
//               categoryName: taskData[1],
//               vendorName: taskData[2],
//               totalPrice: taskData[3],
//               eventName: taskData[4],
//               targetBudget: taskData[5],
//             );

//             return task;
//           }
//         }
//       }
//     } catch (e) {
//       print("Error while reading from local storage: $e");
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return SafeArea(
//         top: true,
//         bottom: true,
//         left: true,
//         right: true,
//         // ignore: sort_child_properties_last
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             // backgroundColor: Color.fromARGB(255, 18, 140, 126),
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(height * 0.1),

//               // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

//               child: AppBar(
//                 titleSpacing: 2.2,
//                 forceMaterialTransparency: false,
//                 backgroundColor: Color.fromARGB(255, 18, 140, 126),
//                 automaticallyImplyLeading: true,
//                 centerTitle: true,
//                 flexibleSpace: Center(
//                   child: Text(
//                     'Update Task',
//                     style: TextStyle(
//                         fontSize: width * 0.07,
//                         fontFamily: 'Roboto',
//                         // fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             body: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         margin: EdgeInsets.only(
//                             left: width * 0.15, right: width * 0.15),

//                         borderOnForeground: false,
//                         // child:SingleChildScrollView(
//                         child: DropdownButtonFormField<String>(
//                           value: categoryName,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               categoryName = newValue!;
//                             });
//                           },
//                           items: <String>[
//                             'Decoration',
//                             'Food and Beverages',
//                             ' Option 3',
//                             ' Option 4',
//                             ' Option 5',
//                             ' Option 6',
//                           ].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: SizedBox(
//                                 width: 290,
//                                 height: 60,
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     value,
//                                     style: TextStyle(color: Colors.black87),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           style: const TextStyle(
//                             color: Colors.white,
//                             // fontSize: 20.0,
//                           ),
//                           isExpanded: true,
//                           hint: const Text(
//                             'Add Category',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                           icon: const Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.black,
//                           ),
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade900,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.category_outlined,
//                             ),
//                           ),
//                           focusColor: Colors.white,
//                           dropdownColor: Colors.blueGrey.shade900,
//                         ),
//                       ),

//                       SizedBox(
//                         height: width * 0.05,
//                       ),
//                       // Card(
//                       //   shape: RoundedRectangleBorder(
//                       //       borderRadius: BorderRadius.circular(10.0)),
//                       //   margin: EdgeInsets.only(
//                       //       left: width * 0.15, right: width * 0.15),
//                       //   borderOnForeground: false,
//                       //   // child:DropdownButton<String>(
//                       //   //   value:category,
//                       //   //   items: <String>['Birthday','Ceremony','Wedding'].map<DropDownItem<String>>((String value){
//                       //   //   }).toList(),
//                       //   // )
//                       // ),
//                       SizedBox(
//                         height: width * 0.05,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         margin: EdgeInsets.only(
//                             left: width * 0.15, right: width * 0.15),
//                         borderOnForeground: false,
//                         child: Hero(
//                           tag: 'vendorName',
//                           child: TextFormField(
//                             controller: vendorNameController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "Please enter a task name";
//                               }
//                               return null;
//                             },
//                             // onChanged: (value) {
//                             //   vendorName:
//                             //   value;
//                             // },
//                             decoration: InputDecoration(
//                               border: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               prefixIcon: Icon(Icons.task_outlined),
//                               hintText: 'Vendor Name',
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: width * 0.05,
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         margin: EdgeInsets.only(
//                             left: width * 0.15, right: width * 0.15),
//                         borderOnForeground: false,
//                         child: Hero(
//                           tag: 'totalPrice',
//                           child: TextField(
//                             controller: totalPriceController,
//                             // onChanged: (value) {
//                             //   budget:
//                             //   value;
//                             // },
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               border: UnderlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               prefixIcon: Icon(Icons.attach_money_rounded),
//                               hintText: ' TotalPrice ',
//                             ),
//                           ),
//                         ),
//                       ),

//                       //
//                     ]),
//               ),
//             ),
//             bottomNavigationBar: BottomAppBar(
//                 color: Color.fromARGB(255, 18, 140, 126),
//                 height: 90,
//                 child: Center(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       FloatingActionButton.extended(
//                         heroTag: Text('cancel'),
//                         onPressed: () {
//                           Navigator.pushNamed(context, 'CategoryShownPage');
//                         },
//                         backgroundColor: Colors.blueGrey.shade900,
//                         label: Text(
//                           'Cancel',
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               // fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ),
//                       FloatingActionButton.extended(
//                         heroTag: Text('update'),
//                         onPressed: () async {
//                           if (_formKey.currentState?.validate() == true) {
//                             await updateBudgetTask(
//                               eventtaskController.text,
//                               vendorNameController.text,
//                               totalPriceController.text,
//                             //  eventName!,
//                             // targetBudget!,
//                             );

//                             //trying to view the updated the task

//                             Navigator.pushNamed(context,'CategoryShownPage');

//                             // Navigator.pushNamed(context, 'TaskList');
//                           }
//                         },
//                         backgroundColor: Colors.blueGrey.shade900,
//                         label: Text(
//                           ' Update ',
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))));
//   }

//   void doNothing() {}

//   bool isFormValid() {
//     return _formKey.currentState?.validate() ?? false;
//   }

//   bool isFilled = false;
//   void setValidator(valid) {
//     setState(() {
//       isFilled = valid;
//     });
//   }

//   Future<void> updateBudgetTask(
//     String categoryName,
//     String vendorName,
//     String totalPrice,
   
//   ) async {
//     // final appDocumentDir = await getApplicationDocumentsDirectory();
//     // final filePath = '${appDocumentDir.path}/tasks.txt';
//     taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');

//     if (_formKey.currentState!.validate()) {
//       // Task? = taskBox?.get(taskKey);

//       // if (!= null) {
//       categoryName = eventtaskController.text;
//       vendorName = vendorNameController.text;
//       totalPrice = totalPriceController.text;

//       // Create a new Task object
//       final task = BudgetEvent(
//         taskeventKey: taskbudgetKey,
//         categoryName: categoryName,
//         vendorName: vendorName,
//         totalPrice: totalPrice,
    
//       );
//       // Store the task in Hive
//       await taskbudgetBox?.put(taskbudgetKey, task);
//       await updateBudgetTaskInLocal(task);
//       // }
//       // Clear form data
//       // categoryController.clear();
//       eventtaskController.clear();
//       vendorNameController.clear();
//       totalPriceController.clear();
//     }
//   }

//   Future<void> updateBudgetTaskInLocal(BudgetEvent task) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/budgettask.txt');
//     final exists = await file.exists();

//     if (!exists) {
//       await file.create();
//     }

//     final lines = await file.readAsLines();
//     final updatedLines = <String>[];

//     for (final line in lines) {
//       final taskData = line.split(',');
//       if (taskData[0] == task.taskeventKey) {
//         // Replace the line with the updated task data
//         final updatedTaskData =
//             '${task.taskeventKey},${task.categoryName},${task.vendorName},${task.totalPrice},${task.eventName},${task.targetBudget}';
//         updatedLines.add(updatedTaskData);
//       } else {
//         // Add other tasks as they are
//         updatedLines.add(line);
//       }
//       print(task.vendorName);
//     }
//     await file.writeAsString(updatedLines.join('\n'));
//   }
// }
