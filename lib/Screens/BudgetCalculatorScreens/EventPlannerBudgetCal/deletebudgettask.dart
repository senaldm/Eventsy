import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin DeleteTask {
  static Future<void> deleteTask(String budgetKey) async {
    try {
      final budgetTaskBox = await Hive.openBox<BudgetTasks>('budgettask');

      if (budgetTaskBox.containsKey(budgetKey)) {
        print('Deleting budget with key: $budgetKey');
        budgetTaskBox.delete(budgetKey);
      } else {
        print('Budget with key $budgetKey not found in Hive box');
      }

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/budgetTask.txt');

      if (await file.exists()) {
        final lines = await file.readAsLines();
        final updatedLines = lines.where((line) {
          final taskData = line.split(',');
          final taskKeyInFile = taskData[0];
          return taskKeyInFile != budgetKey;
        }).toList();

        await file.writeAsString(updatedLines.join('\n'));
      }
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}
