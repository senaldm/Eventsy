import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:eventsy/Model/Events/Task.dart';
import 'package:path_provider/path_provider.dart';

class EventController with ChangeNotifier {
  EventController() {
    init();
  }

  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
       [TaskSchema],
      directory: dir.path,
    );

  }

  void addTask(Task TaskSchema) async{

    await isar!.writeTxn(isar) async{
      String taskName=await isar.Task.put(Task);
    }
  }
}
