import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin DeleteTask {
  static Future<void> deleteTask(String taskKey) async {
    final eventTaskBox = await Hive.openBox<EventTasks>('eventTask');


      if (eventTaskBox.containsKey(taskKey)) {
        eventTaskBox.delete(taskKey);
      }
    
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/eventTasks.txt');
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
