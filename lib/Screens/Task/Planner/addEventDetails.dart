// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:eventsy/global.dart';

class addEventDetails extends StatelessWidget {
  // const addEventDetails({super.key});

  final eventNameController = TextEditingController();
  final eventDateController = TextEditingController();
  final noteController = TextEditingController();
  final clientNameController = TextEditingController();
  final venueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor: Colors.greenAccent.shade700,
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text(
                  'Event Details',
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          body: Form(
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
                    child: TextField(
                      controller: eventNameController,
                      decoration: InputDecoration(
                          labelText: "Event Name",
                          icon: Icon(Icons.border_color)),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    borderOnForeground: false,
                    child: TextField(
                      controller: eventDateController,
                      decoration: InputDecoration(
                          labelText: "Date",
                          icon: Icon(Icons.calendar_month_sharp)),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    borderOnForeground: false,
                    child: TextField(
                      controller: noteController,
                      decoration: InputDecoration(
                          labelText: "Note",
                          icon: Icon(Icons.note_add_outlined)),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    borderOnForeground: false,
                    child: TextField(
                      controller: clientNameController,
                      decoration: InputDecoration(
                          labelText: "Client Name",
                          icon: Icon(Icons.note_add_outlined)),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    borderOnForeground: false,
                    child: TextField(
                      controller: venueController,
                      decoration: InputDecoration(
                          labelText: "venue",
                          icon: Icon(Icons.location_city_sharp)),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                ],
              )),
          bottomNavigationBar: BottomAppBar(
              color: Colors.greenAccent.shade700,
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
                        Navigator.pushNamed(context, 'eventList');
                      },
                      backgroundColor: Colors.blueGrey.shade900,
                      label: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    FloatingActionButton.extended(
                      heroTag: Text('next'),
                      onPressed: () async {
                        await addEvent(
                          eventNameController.text,
                          eventDateController.text as DateTime,
                          noteController.text,
                          clientNameController.text,
                          venueController.text,
                        );
                        Navigator.pushNamed(context, '/TaskList');
                      },
                      backgroundColor: Colors.blueGrey.shade900,
                      label: Text(
                        ' Next ',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  addEvent(String eventName, DateTime eventDate, String note, String clientName,
      String venue) async {
    eventBox = await Hive.openBox<Event>('event');
     
     
      // Save the form data to Hive
      eventBox.put('taskName', eventName as Event);
      eventBox.put('vendorName', eventDate as Event);
      eventBox.put('budget', note as Event);
     eventBox.put('categoryName', clientName as Event);
     eventBox.put('isComplete', venue as Event);

     
  
   
  }
}
