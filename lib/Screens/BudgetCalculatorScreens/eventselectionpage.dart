// ignore_for_file: avoid_single_cascade_in_expression_statements
import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable

class EventSelectionPage extends StatefulWidget {
  EventSelectionPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventSelectionPageState createState() => _EventSelectionPageState();
}

class _EventSelectionPageState extends State<EventSelectionPage> {
  // ignore: avoid_init_to_null
  // String? selectedValue = null;

  // @override
  // void dispose() {
  //   final eventsBox = Boxes.getEvent();
  //   if (eventsBox.isOpen) {
  //     eventsBox.close();
  //   }
  //   super.dispose();
  // }

  final List<Eventset> events = [];

  String? eventName;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      right: true,
      bottom: true,
      left: true,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),

          // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Colors.greenAccent.shade700,
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text(
                'Budget  Calculator',
                style: TextStyle(
                    fontSize: width * 0.07,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                // ignore: prefer_const_constructors

                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(top: 230),
                  // ignore: prefer_const_constructors

                  child: SizedBox(
                    width: width * 0.8,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.calculate),
                        hintText: 'Add Target Budget',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: 'Roboto'),
                        // hoverColor: const Color.fromARGB(222, 2, 2, 2),
                      ),
                      keyboardType: TextInputType.number,
                  
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                      cursorColor: const Color.fromARGB(255, 0, 255, 13),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  // ignore: avoid_unnecessary_containers
                  child: Center(
                    child: SizedBox(
                      width: width * 0.8,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: DropdownButtonFormField<String>(
                          alignment: AlignmentDirectional.center,
                          decoration: InputDecoration(
                            // ignore:prefer_const_constructors
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          focusColor: Colors
                              .grey, // Customizing dropdown button text style
                          dropdownColor: Colors.grey,
                          value: eventName,
                          elevation: 0,
                          onChanged: (String? newval) {
                            setState(() {
                              eventName = newval;
                            });
                          },
                          items: <String>[
                            "Wedding",
                            "Big Girl Party",
                            "Get to gethor",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(
                                width:
                                    290, // Customizing the width of the DropdownMenuItem
                                height:
                                    60, // Customizing the height of the DropdownMenuItem
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(value,
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            );
                          }).toList(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          isExpanded: true,
                          hint: const Text(
                            'Event Name',
                            style: TextStyle(color: Colors.white),
                            //textAlign: Align(alignment: Alignment.center,),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.greenAccent.shade700,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  child: const Text(
                    ' Back ',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await addEvent(eventName);

                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      './CategoryShownPage',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  child: const Text(
                    ' Next ',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addEvent(String? eventName) async {
    final events = Eventset();
    events.eventName = eventName!;

    eventsBox.put("events", events);

    // box.close();
  }
}
