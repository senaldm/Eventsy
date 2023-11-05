// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/Model/Vendor/vendor.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
// import 'package:eventsy/main.dart';

class AddVendor extends StatefulWidget {
  const AddVendor({Key? key}) : super(key: key);

  @override
  _AddVendorState createState() => _AddVendorState();
}

class _AddVendorState extends State<AddVendor> {
  final vendorNameController = TextEditingController();
  final dateController = TextEditingController();
  final noteController = TextEditingController();
  bool isConfirmed = false;

  final String label = "Vendor Confirmed";
  bool isSwitchOn = false;

  final bool value = false;
  final bool onChanged = true;
  final _formKey = GlobalKey<FormState>();
  final List<Vendor> vendor = [];
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
                    'Add Vendor',
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontFamily: 'Roboto',
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            body:
                //             SingleChildScrollView(
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                Container(
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
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10.0)),
                      //   margin: EdgeInsets.only(
                      //       left: width * 0.15, right: width * 0.15),

                      //   borderOnForeground: false,
                      //   // child:SingleChildScrollView(
                      //   child: DropdownButtonFormField<String>(
                      //     // onChanged: (String? newValue) {
                      //     //   setState(() {
                      //     //     categoryName = newValue!;
                      //     //   });
                      //     // },
                      //     // value: categoryName,
                      //     items: <String>[
                      //       'Decoration',
                      //       'Food and Beverages',
                      //       'Option 3',
                      //       'Option 4',
                      //       'Option 5',
                      //       'Decorations',
                      //       'Food and Beveragess',
                      //       'Option 3s',
                      //       'Option 4s',
                      //       'Option 5s',
                      //       'Decorationy',
                      //       'Food and Beveragesy',
                      //       'Option 3y',
                      //       'Option 4y',
                      //       'Option 5y',
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: SizedBox(
                      //           width: 290,
                      //           height: 60,
                      //           child: Align(
                      //             alignment: Alignment.center,
                      //             child: Text(
                      //               value,
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     }).toList(),

                      //     style: const TextStyle(
                      //       color: Colors.black87,
                      //       // fontSize: 20.0,
                      //     ),
                      //     isExpanded: true,
                      //     hint: const Text(
                      //       'Add Category',
                      //       style: TextStyle(color: Colors.black),
                      //     ),
                      //     icon: const Icon(
                      //       Icons.arrow_drop_down,
                      //       color: Colors.black87,
                      //     ),
                      //     decoration: InputDecoration(
                      //       fillColor: Colors.grey.shade900,
                      //       border: UnderlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),

                      //       ),
                      //       prefixIcon: Icon(Icons.category_outlined,),
                      //       hintText: 'Category',
                      //     ),
                      //     focusColor: Colors.black87,
                      //     dropdownColor: Colors.blueGrey.shade900,
                      //   ),
                      // ),

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
                          tag: 'vendorName',
                          child: TextFormField(
                            controller: vendorNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a vendor name";
                              }
                              return null;
                            },
                            //   validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter a task name';
                            //   }
                            //   return null;

                            // },

                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              prefixIcon: Icon(Icons.person_outlined),

                              hintText: 'vendor Name',
                              // prefixText:'Task Name',
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
    borderRadius: BorderRadius.circular(10.0),
  ),
  margin: EdgeInsets.only(
    left: width * 0.15,
    right: width * 0.15,
  ),
  borderOnForeground: false,
  child: Hero(
    tag: 'date',
    child: MaterialButton(
      onPressed: _showDatePicker,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 12.0),
            child: Icon(
              Icons.date_range, // Change the icon here
              color: Color.fromARGB(255, 149, 148, 148), // Change the color of the date icon
              size: 24.0,
            ),
          ),
          Expanded(
            child: Text(
              dateController.text.isNotEmpty
                  ? dateController.text
                  : 'Meet Date',
              style: TextStyle(
                fontSize: 16.0,
                color: dateController.text.isNotEmpty
                    ? Colors.black
                    : Color.fromARGB(255, 127, 124, 124),
              ),
            ),
          ),
        ],
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
                          tag: 'note',
                          child: TextField(
                            controller: noteController,
                            // onChanged: (value) {
                            //   budget:
                            //   value;
                            // },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              prefixIcon: Icon(Icons.note_rounded),
                              hintText: ' Note ',
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
                              // setState(() {
                              //   isSwitchOn = newValue;
                              // });
                            },
                          ),
                        ],
                      )
                      //
                    ]),
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
                          Navigator.pushNamed(context, 'VendorList');
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
                            await addVendor(
                              vendorNameController.text,
                              dateController.text,
                              noteController.text,
                              isConfirmed,
                            );
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

 void _showDatePicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),

       builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Color(0xFF128C7E), // ARGB(255, 18, 140, 126)
          colorScheme: ColorScheme.light(primary: Color(0xFF128C7E)),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
    );

    if (selectedDate != null) {
      setState(() {
        dateController.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }



  addVendor(
      String vendorName, String date, String note, bool isConfirmed) async {
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final filePath = '${appDocumentDir.path}/tasks.txt';
    final vendorBox = await Hive.openBox<Vendor>('vendor');
    final uniqueKey = Uuid().v4();

    if (_formKey.currentState!.validate()) {
      // categoryName = categoryController.text;
      vendorName = vendorNameController.text;
      date = dateController.text;
      note = noteController.text;
      isConfirmed = isSwitchOn;
      final String uniqueKey = Uuid().v4();

      // Create a new Task object
      final vendor = Vendor(
        vendorName: vendorName,
        date: date,
        note: note,
        isComplete: isConfirmed,
      );

      // Store the task in Hive
      await vendorBox.put(uniqueKey, vendor);
      storeVendor(vendor);

      // Clear form data
      // categoryController.clear();
      vendorNameController.clear();
      dateController.clear();
      noteController.clear();
    }
  }

  Future<void> storeVendor(Vendor vendor) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/vendors.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    //final formattedTimestamp = vendor.timestamp?.toIso8601String() ?? '';

    final vendorData =
        '${vendor.vendorName},${vendor.date},${vendor.note},${vendor.isComplete}\n';
    await file.writeAsString(vendorData, mode: FileMode.append);
  }
}
