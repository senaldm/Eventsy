import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin DeleteTask {
  static Future<void> deleteTask(String taskKey) async {
    final taskBox = await Hive.openBox<Task>('task');

  
      if (taskBox.containsKey(taskKey)) {
        taskBox.delete(taskKey);
      }
    
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/tasks.txt');
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
