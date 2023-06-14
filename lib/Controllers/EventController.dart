// import 'package:eventsy/Model/Events/Event.dart';
// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import 'package:eventsy/Model/Events/Task.dart';
// import 'package:path_provider/path_provider.dart';

// class EventController with ChangeNotifier {
//   late Future<Isar> db;
//   EventController() {
//     db = init();
//   }

//   init() async {
//     final dir = await getApplicationDocumentsDirectory();
//     if (Isar.instanceNames.isEmpty) {
//       return await Isar.open(
//         [TaskSchema, EventSchema],
//         directory: dir.path,
//       );
//     }
//     return Future.value(Isar.getInstance());
//   }

//   // Future<void> addTask(Task newTask) async {
//   //   final isar = await db;
//   //   isar.writeTxnSync(() async {
//   //     String taskName = await isar.Task.put(Task);
//   //   });
//   // }

//   Future<List<Task>> getAllTasks() async {
//     final isar = await db;
//     return await isar.tasks.where().findAll();
//   }
// }
