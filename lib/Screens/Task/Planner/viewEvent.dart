// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:eventsy/Model/Event.dart';
import 'package:eventsy/Screens/Task/Planner/deleteEvent.dart';
import 'package:flutter/material.dart';

class ViewEvent extends StatelessWidget with DeleteEvent {
  final Event event;
  const ViewEvent({
    required this.event,
  });

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
                onPressed: () {
                  DeleteEvent.deleteEvent(event.eventKey);
                  bool isDeleted = true;
                  Navigator.pop(context,isDeleted);
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
                      context, '/updateevent',
                      arguments: event.eventKey);
                  Navigator.pop(context, updatedevent);
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        body: Container(
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
                        Navigator.pop(context);
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
    );
  }
}
