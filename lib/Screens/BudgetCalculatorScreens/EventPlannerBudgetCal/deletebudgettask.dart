import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin DeleteTask {
  static Future<void> deleteTask(String taskKey) async {
    final budgetTaskBox = await Hive.openBox<BudgetTasks>('budgettask');

    if (budgetTaskBox.containsKey(taskKey)) {
      print('Deleting budget with key: $taskKey');
      budgetTaskBox.delete(taskKey);
    } else {
      print('Budget with key $taskKey not found in Hive box');
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgetTask.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final taskData = line.split(',');
        final taskKeyInFile = taskData[0];
        return taskKeyInFile != taskKey;
      }).toList();

      await file.writeAsString(updatedLines.join('\n'));
    }
  }
}
