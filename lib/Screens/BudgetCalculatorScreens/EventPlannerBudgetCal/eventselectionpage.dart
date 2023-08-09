// ignore_for_file: avoid_single_cascade_in_expression_statements
import 'package:eventsy/Model/Event.dart';
import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class EventSelectionPage extends StatefulWidget {
  EventSelectionPage({Key? key}) : super(key: key);

  @override
  _EventSelectionPageState createState() => _EventSelectionPageState();
}

class _EventSelectionPageState extends State<EventSelectionPage> {
  final List<BudgetEvent> events = [];
  String? eventName;
  String? targetBudget;
  String? eventKey;
  final targetBudgetController = TextEditingController();
  final eventController = TextEditingController();

  void initState() {
    super.initState();
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    eventbudgetBox = await Hive.openBox<BudgetEvent>('budgetevent');
    // Retrieve the data from Hive box if available
    final storedEvent = eventbudgetBox!.get('budgetEventKey');
    if (storedEvent != null) {
      setState(() {
        eventName = storedEvent.eventName;
        targetBudget = storedEvent.targetBudget;
        eventKey = storedEvent.eventKey;
        // Set the initial values in the controllers
        targetBudgetController.text = targetBudget?? '';
        eventController.text = eventName ?? '';
      });
    }
  }

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
          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text(
                'Budget Calculator',
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 24, 26),
              image: DecorationImage(
                image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 230),
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
                          fontFamily: 'Roboto',
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                      cursorColor: const Color.fromARGB(255, 0, 255, 13),
                      onChanged: (value) {
                        setState(() {
                          targetBudget = value;
                        });
                      },
                      controller: targetBudgetController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: SizedBox(
                      width: width * 0.8,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: DropdownButtonFormField<String>(
                          alignment: AlignmentDirectional.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          focusColor: Colors.grey,
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
                            "Get together",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(
                                width: 290,
                                height: 60,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Event Name',
                            style: TextStyle(color: Colors.white),
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
          color: Color.fromARGB(255, 18, 140, 126),
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
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    ' Back ',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await addEvent(
                      eventName,
                      targetBudget,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      'CategoryShownPage',
                      arguments: {
                        'eventName':eventName,
                         'targetBudget':targetBudget,
                         'eventKey':eventKey,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900,
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    ' Next ',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addEvent(
    String? eventName,
    String? targetBudget,
  ) async {
    // Assuming BudgetEvent constructor takes eventName and targetBudget as parameters
    final String eventKey = const Uuid().v4();

    final budgetEvent = BudgetEvent(
        eventName: eventName!, targetBudget: targetBudget!, eventKey: eventKey);
  
    // Put the budgetEvent object into the eventbudgetBox
    eventbudgetBox.put('budgetEventKey', budgetEvent);
    
  }
  
}