// import 'package:flutter/material.dart';
// import 'package:eventsy/global.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';

// class NormalBudgetOptionPage extends StatefulWidget {
//   NormalBudgetOptionPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<NormalBudgetOptionPage> createState() => _NormalBudgetOptionPageState();
// }

// class _NormalBudgetOptionPageState extends State<NormalBudgetOptionPage> {
//   String? taskName;
//   String? vendorName;
//   double? totalPrice;
//   String? categoryName;

//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black12,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
//           child: Center(
//             child: Column(children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 // ignore: avoid_unnecessary_containers
//                 child: Container(
//                   child: const Text(
//                     "Add Sub Task",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Container(
//                   width: width * 0.8,
//                   color: Colors.grey.shade900,
//                   child: TextField(
//                     // ignore: prefer_const_constructors
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22.0,
//                         fontWeight: FontWeight.bold),
//                     onChanged: (value) {
//                       setState(() {
//                         taskName = value;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Container(
//                   child: Text('Add Vendor',
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Container(
//                   color: Colors.grey.shade900,
//                   width: width * 0.8,
//                   child: TextField(
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold),
//                     onChanged: (value) {
//                       setState(() {
//                         vendorName = value;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                       hintText: "",
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Container(
//                   child: Text('Add Total Cost',
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Container(
//                   color: Colors.grey.shade900,
//                   width: width * 0.8,
//                   child: TextField(
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold),
//                     onChanged: (value) {
//                       setState(() {
//                         try {
//                           totalPrice = double.parse(value);
//                         } catch (e) {
//                           // Handle the error
//                           totalPrice =
//                               null; // Set the value to null or provide a fallback value
//                           print('Error parsing total price: $e');
//                         }
//                       });
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                       hintText: "",
//                     ),
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           color: Colors.transparent,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 30),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     addTask(taskName, vendorName, totalPrice);
//                     Navigator.pushNamed(
//                       context,
//                       './CategoryShownPage',
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey.shade900,
//                       minimumSize: Size(100, 50),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   child: const Text(
//                     'Save',
//                     style:
//                         TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     Navigator.pushNamed(
//                       context,
//                       './CategoryShownPage',
//                     );
//                     // ignore: use_build_context_synchronously
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey.shade900,
//                       minimumSize: Size(100, 50),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   child: const Text(
//                     'Cancel',
//                     style:
//                         TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> addTask(
//       String? taskName, String? vendorName, double? totalPrice) async {
//     final task = SubTaskSet();

//     task.categoryName = categoryName!;
//     task.taskName = taskName!;
//     task.vendorName = vendorName!;
//     task.totalPrice = totalPrice!.toInt();
//     taskBox.add(task);
//   }
// }
