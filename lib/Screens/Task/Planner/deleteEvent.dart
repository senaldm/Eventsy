import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin DeleteEvent {
  static Future<void> deleteEvent(String eventKey) async {
    final eventBox = await Hive.openBox<Event>('event');

    if (eventBox.containsKey(eventKey)) {
      eventBox.delete(eventKey);
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/events.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final eventData = line.split(',');
        final eventKeyInFile = eventData[0];
        return eventKeyInFile != eventKey;
      }).toList();

      await file.writeAsString(updatedLines.join('\n'));
    }
  }
}
