// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/Event.dart';

import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'package:intl/intl.dart';

class BugetAddingEventList extends StatefulWidget {
  // const BugetAddingEventList({ Key? key }) : super(key: key);
  @override
  _BugetAddingEventListState createState() => _BugetAddingEventListState();
}

class _BugetAddingEventListState extends State<BugetAddingEventList> {
  Box<Event>? eventBox;
  List<Event> events = [];
  List<Event> originalEvents = [];
  late String time;
  @override
  void initState() {
    super.initState();
    openHiveBox();
    retrieveData();
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    eventBox = await Hive.openBox<Event>('event');
  }

  Future<void> retrieveData() async {
    // Retrieve data from Hive box
    events = eventBox?.values.toList() ?? [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/events.txt');

    if (await file.exists()) {
      final lines = await file.readAsLines();
      List<Event> newEvents = [];
      lines.forEach((line) {
        final eventData = line.split(',');
        final event = Event(
          eventKey: eventData[0],
          eventName: eventData[1],
          eventDate: DateTime.tryParse(eventData[2]),
          note: eventData[3],
          venue: eventData[4],
          isEventComplete: eventData[5] == 'false',
          timestamp: DateTime.tryParse(eventData[6]),
        );

        if (event.timestamp == null) {
          event.timestamp = DateTime(0);
          time = "null";
        } else {
          // time = event.timestamp!.toIso8601String();
          time = DateFormat('yyyy-MM-dd').format(event.timestamp!).toString();
        }

        // events.add(event);
        newEvents.add(event);
      });
      setState(() {
        events = newEvents;
        originalEvents = newEvents.toList();
      });
    } else {
      file.create(recursive: true);
      // Update the UI
    }
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  String sort = 'accentOrder';
  String filter = 'all';

  List<Task>? sortEventsByMethod(String method) {
    setState(() {
      if (method == 'accent') {
        return events.sort((a, b) => a.eventName.compareTo(b.eventName));
      } else if (method == 'deaccent') {
        return events.sort((a, b) => b.eventName.compareTo(a.eventName));
      } else if (method == 'newestFirst') {
        return events.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
      } else if (method == 'oldestFirst') {
        return events.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      }
    });
    return null;
  }

  void filterEventsByMethod(String method) {
    setState(() {
      // events = newevents;
      if (method == 'completed') {
        events =
            originalEvents.where((events) => events.isEventComplete).toList();
      } else if (method == 'pending') {
        // events = newevents;
        events =
            originalEvents.where((events) => !events.isEventComplete).toList();
      } else {
        // Reset the events list to show all events
        retrieveData();
      }
      // events = newevents;
    });
  }

  Future<void> deleteEvent(String eventKey) async {
    final eventBox = await Hive.openBox<Task>('event');

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

  // ////////////////////Edit or delete////////////////////////////
  /////////////////////////////////////////////////////////

  editOrDelete(String key) {
    // String eventKey = key;
    String eventKey = key;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final updatedEvent = await Navigator.pushNamed(
                          context, '/updateEvent',
                          arguments: eventKey);
                      retrieveData();
                      // if (updatedEvent != null) {
                      //   // If a new event is added, update the data and refresh the UI
                      //   setState(() {
                      //     events.add(updatedEvent as Task);
                      //   });
                      // }

                      Navigator.pop(context, updatedEvent);
                      // Navigator.pushNamed(context,'UserHome');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 37, 211, 102),
                    ),
                    child: Text(" Edit ",
                        style: TextStyle(
                          color: Colors.black87,
                        ))),
                ElevatedButton(
                    onPressed: () async {
                      await deleteEvent(eventKey);
                      retrieveData();
                      Navigator.pop(context, null);
                      // deleteEvent(eventKey);
                      // Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      // alignment:,
                      backgroundColor: Color.fromARGB(255, 118, 6, 6),
                    ),
                    child: Text("Delete",
                        style: TextStyle(
                          color: Colors.black87,
                        ))),
              ],
            ),
          );
        });
    //return action;
  }

//////////////////main view///////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
  ///
  // var events = eventBox.values.toList();

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> BugetAddingEventList = retriveEvent();

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            // titleSpacing: 2.2,
            // forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'EventselectionPage');
                },
                child: Transform.scale(
                  scale: 1.5, // Increase the size of the icon
                  child: Icon(Icons.add),
                  
                ),
              ),
            ],
            
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text('Event List',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    // fontSize: 30,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: ()  async {
              Navigator.popUntil(context, ModalRoute.withName('PlannerHome'));
              return false;
          },
          child: events.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 20, 24, 26),
                    image: DecorationImage(
                      image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Images/Task/emptyTask.jpg"),
                      ),
                    ),
                  ))
              : Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 20, 24, 26),
                    image: DecorationImage(
                      image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.zero,
                    shrinkWrap: false,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
        
                      return SizedBox(
                        height: 70.0,
                        child: Container(
                          // color: Color.fromARGB(255, 20, 24, 26),
                          padding: EdgeInsetsDirectional.zero,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.white12, width: 0.0
                                          //  Theme.of(context).dividerColor
                                          ))),
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 0, top: 0),
                          // color: Color.fromARGB(255, 20, 24, 26),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                color: Color.fromARGB(255, 20, 24, 26),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        
                                child: ListTile(
                                  leading: Text(
                                    event.eventName,
        
                                    //  "${event.timestamp?.minute?.toString()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  textColor: Colors.white,
                                  trailing: Text(
                                    time,
                                  ),
                                  onTap: () async {
                                    Navigator.pushNamed(context, 'BudgetTaskList',
                                        arguments: event);
                                    setState(() {
                                      retrieveData();
                                    });
                                  },
                                  onLongPress: () async {
                                    // final updatedEvent = editOrDelete(event.eventKey);
                                    // if (updatedEvent != null) {
        
                                    //   setState(() {
                                    //     retrieveData();
                                    //   }
                                    //   );
                                    // }
                                    // // await retrieveData();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
