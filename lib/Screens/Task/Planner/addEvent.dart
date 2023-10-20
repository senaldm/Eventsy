// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:eventsy/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// import 'package:eventsy/main.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String eventName = '';

  DateTime eventDate = DateTime.now();
  String note = '';
  String venue = '';
  bool isEventComplete = false;
  final String label = "Event Completed";
  bool isSwitchOn = false;

  final eventNameController = TextEditingController();
  final noteController = TextEditingController();
  final venueController = TextEditingController();
  final eventStatusController = TextEditingController();
  // final eventDateController =TextEditingController(text: eventDate.toLocal().toString().split(' ')[0]);

  // final bool value = false;
  // final bool onChanged = true;
  final _formKey = GlobalKey<FormState>();
  final List<Event> event = [];

  void showDatePicker(BuildContext context) async {
    DateTime? newEventDate = await showRoundedDatePicker(
      context: context,
      theme: ThemeData.dark(),
    );
    // eventDate = newDateTime!;
    if (newEventDate != null) {
      setState(() {
        eventDate = newEventDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? source =
        ModalRoute.of(context)?.settings.arguments as String?;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        // ignore: sort_child_properties_last
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: Color.fromARGB(255, 18, 140, 126),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.1),

              // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

              child: AppBar(
                titleSpacing: 2.2,
                forceMaterialTransparency: false,
                backgroundColor: Color.fromARGB(255, 18, 140, 126),
                automaticallyImplyLeading: true,
                centerTitle: true,
                flexibleSpace: Center(
                  child: Text(
                    'Event List',
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontFamily: 'Roboto',
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            body: WillPopScope(
              onWillPop: () async {
                await Navigator.pushNamed(context, '/TaskExplore');
                return false;
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: Hero(
                            tag: 'eventName',
                            child: TextFormField(
                              controller: eventNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the Event name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon: Icon(Icons.event_outlined),

                                hintText: 'Event Name',
                                // prefixText:'event Name',
                                // prefixIconColor:Colors.green,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),

                          borderOnForeground: false,
                          // child:SingleChildScrollView(
                          child: TextFormField(
                            onTap: () {
                              showDatePicker(context);
                            },
                            // keyboardType: TextInputType.datetime,
                            controller: TextEditingController(
                                text: eventDate
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]),
                            readOnly: true,
                            style: const TextStyle(
                              color: Colors.black87,
                              // fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade900,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_month_rounded,
                              ),
                              hintText: 'Event Date',
                            ),
                          ),
                        ),

                        SizedBox(
                          height: width * 0.05,
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: Hero(
                            tag: 'note',
                            child: TextField(
                              controller: noteController,
                              // onChanged: (value) {
                              //   note:
                              //   value;
                              // },
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon: Icon(Icons.note_alt_outlined),
                                hintText: 'Note',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: Hero(
                            tag: 'venue',
                            child: TextField(
                              controller: venueController,
                              // onChanged: (value) {
                              //   venue:
                              //   value;
                              // },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon: Icon(Icons.location_on),
                                hintText: ' venue ',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: width * 0.05,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: label,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SlidingSwitch(
                              value: false,
                              width: 100,
                              height: 50,
                              onTap: () {},
                              onDoubleTap: () {},
                              onSwipe: () {},
                              iconOff: Icons.cancel_rounded,
                              iconOn: Icons.done,
                              contentSize: 24,
                              colorOn: Color.fromARGB(255, 10, 224, 17),
                              colorOff: Color.fromARGB(255, 126, 19, 11),
                              background: Colors.black87,
                              buttonColor: const Color(0xfff7f5f7),
                              inactiveColor: const Color(0xff636f7b),
                              onChanged: (bool newValue) {
                                setState(() {
                                  isSwitchOn = newValue;
                                });
                              },
                            ),
                          ],
                        )
                        //
                      ]),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Color.fromARGB(255, 18, 140, 126),
              height: 90,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (source == 'fromBugetAddingEventList' &&
                        _formKey.currentState?.validate() == true) ...[
                      FloatingActionButton.extended(
                        onPressed: () async {
                          final confirmed = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmation'),
                                content: Text(
                                    'Are you sure you want to add this event?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(true); // Yes, return true
                                    },
                                    child: Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(false); // No, return false
                                    },
                                    child: Text('No'),
                                  ),
                                ],
                              );
                            },
                          );

                          if (confirmed == true) {
                            await addEvent(
                              eventDate,
                              eventNameController.text,
                              venueController.text,
                              noteController.text,
                              isSwitchOn,
                            );
                            Navigator.pop(context);
                            // Go back to the previous page after saving
                          }
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Save ',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      FloatingActionButton.extended(
                        heroTag: Text('cancel'),
                        onPressed: () {
                          Navigator.pushNamed(context, 'BudgetAddingEventList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ] else ...[
                      FloatingActionButton.extended(
                        heroTag: Text('cancel'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/eventList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      FloatingActionButton.extended(
                        heroTag: Text('save'),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            await addEvent(
                              eventDate,
                              eventNameController.text,
                              venueController.text,
                              noteController.text,
                              isSwitchOn,
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          }
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Save ',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            )));
  }

  void doNothing() {}

  bool isFormValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  bool isFilled = false;
  void setValidator(valid) {
    setState(() {
      isFilled = valid;
    });
  }

  addEvent(DateTime eventDate, String eventName, String venue, String note,
      bool isSwitchOn) async {
    eventBox = await Hive.openBox<Event>('event');

    if (_formKey.currentState!.validate()) {
      eventDate = eventDate;
      eventName = eventNameController.text;
      note = noteController.text;
      venue = venueController.text;
      isEventComplete = isSwitchOn;
      final String uniqueEventKey = Uuid().v4();

      // Create a new event object
      final event = Event(
          eventKey: uniqueEventKey,
          eventDate: eventDate,
          eventName: eventName,
          note: note,
          venue: venue,
          isEventComplete: isEventComplete,
          timestamp: DateTime.now());

      await eventBox.put(uniqueEventKey, event);
      storeEvent(event);

      // Clear form data
      // categoryController.clear();
      eventNameController.clear();
      venueController.clear();
      noteController.clear();
    }
  }

  Future<void> storeEvent(Event event) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/events.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    final formattedTimestamp = event.timestamp?.toIso8601String() ?? '';
    final formatedEventDate = event.eventDate?.toIso8601String() ?? '';

    final eventData =
        '${event.eventKey},${event.eventName},$formatedEventDate,${event.note},${event.venue},${event.isEventComplete},$formattedTimestamp\n';
    await file.writeAsString(eventData, mode: FileMode.append);
  }
}
