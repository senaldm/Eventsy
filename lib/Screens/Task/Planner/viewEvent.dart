// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:eventsy/Screens/Task/Planner/deleteEvent.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ViewEvent extends StatelessWidget with DeleteEvent {
  final Event event;
  const ViewEvent({
    required this.event,
  });

  Future<void> deleteEvent(String eventKey) async {
    final eventBox = await Hive.openBox<Event>('event');
    final eventTaskBox = await Hive.openBox<EventTasks>('eventTask');

    if (eventBox.containsKey(eventKey)) {
      eventBox.delete(eventKey);
      eventTaskBox.delete(eventKey);
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

    final eventTaskFile = File('${directory.path}/eventTasks.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final taskData = line.split(',');
        final taskKeyInFile = taskData[0];
        return taskKeyInFile != eventKey;
      }).toList();

      await eventTaskFile.writeAsString(updatedLines.join('\n'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            title: Text(
              event.eventName,
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  deleteEvent(event.eventKey);

                 await Navigator.pushNamed(context, '/EventList');
                  // Navigator.pushNamed(context, 'EventList');
                  // then((result) {
                  //   if (result != null && result is bool && result) {
                  //     // Navigation completed successfully, call retrieveData
                  //     retrieveData(event.eventKey);
                  //   }
                  // });
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () async {
                  final updatedevent = await Navigator.pushNamed(
                      context, '/updateEvent',
                      arguments: event);
                  Navigator.pop(context, updatedevent);
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            await Navigator.pushNamed(context, '/eventTaskList',
                arguments: event);
            return false;
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
                child: Container(
                  // color: Color.fromARGB(255, 20, 24, 26),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 20, 29, 32),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 3.0,
                      color: const Color.fromARGB(179, 156, 154, 154),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'event Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.assignment),
                        title: Text('event Name'),
                        subtitle: Text(event.eventName),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.note_alt_outlined),
                        title: Text('Note'),
                        subtitle: Text(event.note),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.location_on),
                        title: Text('Venue'),
                        subtitle: Text(event.venue),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.check),
                        title: Text('Is Complete'),
                        subtitle: Text(event.isEventComplete ? 'Yes' : 'No'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 18, 140, 126),
                        ),
                        onPressed: () {
                          print(event.isEventComplete);
                          Navigator.pushNamed(context, '/eventTaskList',
                              arguments: event);
                        },
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
