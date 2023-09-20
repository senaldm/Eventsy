// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';

import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class UpdateEvent extends StatefulWidget {
  final Event event;
  const UpdateEvent({required this.event});

  @override
  _UpdateEventState createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  String eventName = '';

  late DateTime eventDate;
  String note = '';
  String venue = '';
  late bool isEventComplete;
  final String label = "Event Completed";
  late bool isSwitchOn;
  late Event currentEvent;
  late String eventKey;

  final eventNameController = TextEditingController();
  final noteController = TextEditingController();
  final venueController = TextEditingController();
  final eventStatusController = TextEditingController();
  // final eventDateController =TextEditingController(text: eventDate.toLocal().toString().split(' ')[0]);

  // final bool value = false;
  // final bool onChanged = true;
  final _formKey = GlobalKey<FormState>();
  final List<Event> event = [];

  void initState() {
    super.initState();
    currentEvent = widget.event;

    currentEvent.eventName.isEmpty
        ? currentEvent.eventName = " "
        : currentEvent.eventName;
    currentEvent.venue.isEmpty ? currentEvent.venue = " " : currentEvent.venue;
    currentEvent.note.isEmpty ? currentEvent.note = " " : currentEvent.note;

    eventNameController.text = currentEvent.eventName;
    noteController.text = currentEvent.note;
    venueController.text = currentEvent.venue;
    isSwitchOn = currentEvent.isEventComplete;
    eventDate = currentEvent.eventDate!;
    eventKey = currentEvent.eventKey;
  }

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
                Navigator.pop(context);
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
                              onChanged: (value) {
                                setState(() {
                                  isFilled = value.isNotEmpty;
                                });
                              },
                              //   validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter a event name';
                              //   }
                              //   return null;

                              // },

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

                            // DropdownButtonFormField<String>(
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       eventDate = newValue!;
                            //     });
                            //   },
                            //   // value: eventDate,
                            //   items: <String>[
                            //     'Decoration',
                            //     'Food and Beverages',
                            //     'Option 3',
                            //     'Option 4',
                            //     'Option 5',
                            //     'Decorations',
                            //     'Food and Beveragess',
                            //     'Option 3s',
                            //     'Option 4s',
                            //     'Option 5s',
                            //     'Decorationy',
                            //     'Food and Beveragesy',
                            //     'Option 3y',
                            //     'Option 4y',
                            //     'Option 5y',
                            //   ].map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: SizedBox(
                            //         width: 290,
                            //         height: 60,
                            //         child: Align(
                            //           alignment: Alignment.center,
                            //           child: Text(
                            //             value,
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            // }).toList(),

                            style: const TextStyle(
                              color: Colors.black87,
                              // fontSize: 20.0,
                            ),
                            // isExpanded: true,
                            // hint: const Text(
                            //   'Add Category',
                            //   style: TextStyle(color: Colors.black),
                            // ),
                            // icon: const Icon(
                            //   Icons.arrow_drop_down,
                            //   color: Colors.black87,
                            // ),
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
                            // focusColor: Colors.black87,
                            // dropdownColor: Colors.blueGrey.shade900,
                          ),
                        ),

                        // SizedBox(
                        //   height: width * 0.05,
                        // ),

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
                              value: isSwitchOn,
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
                        heroTag: Text('update'),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            await UpdateEvent(
                              eventDate,
                              eventNameController.text,
                              venueController.text,
                              noteController.text,
                              isSwitchOn,
                            );
                            Navigator.pushNamed(context, '/viewEvent',
                                arguments: currentEvent);
                          }
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Update ',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))));
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

  UpdateEvent(DateTime eventDate, String eventName, String venue, String note,
      bool isSwitchOn) async {
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final filePath = '${appDocumentDir.path}/events.txt';
    eventBox = await Hive.openBox<Event>('event');

    if (_formKey.currentState!.validate()) {
      eventDate = eventDate;
      // eventDate = categoryController.text;
      eventName = eventNameController.text;
      note = noteController.text;
      venue = venueController.text;
      isEventComplete = isSwitchOn;

      // Create a new event object
      final event = Event(
          eventKey: eventKey,
          eventDate: eventDate,
          eventName: eventName,
          note: note,
          venue: venue,
          isEventComplete: isEventComplete,
          timestamp: DateTime.now());

      await eventBox.put(eventKey, event);
      setState(() {
        currentEvent = event;
      });
      updateEventInLocal(event);

      // Clear form data
      // categoryController.clear();
      eventNameController.clear();
      venueController.clear();
      noteController.clear();
    }
  }

  Future<void> updateEventInLocal(Event event) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/events.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    final lines = await file.readAsLines();
    final updatedLines = <String>[];

    for (final line in lines) {
      final eventData = line.split(',');
      if (eventData[0] == event.eventKey) {
        final formattedTimestamp = event.timestamp?.toIso8601String() ?? '';

        final formatedEventDate = event.eventDate?.toIso8601String() ?? '';

        final updatedEventData =
            '${event.eventKey},${event.eventName},$formatedEventDate,${event.note},${event.venue},${event.isEventComplete},$formattedTimestamp';

        updatedLines.add(updatedEventData);
      } else {
        // Add other tasks as they are
        updatedLines.add(line);
      }
    }
    await file.writeAsString(updatedLines.join('\n'));
  }
}
