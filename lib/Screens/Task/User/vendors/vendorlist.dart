// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/Vendor/vendor.dart';

import 'package:path_provider/path_provider.dart';

import 'package:eventsy/Screens/Task/User/vendors/addVendor.dart';

import 'dart:io';
import 'package:intl/intl.dart';

class VendorList extends StatefulWidget {
   const VendorList({ Key? key }) : super(key: key);
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  Box<Vendor>? vendorBox;
  List<Vendor> vendors = [];
  List<Vendor> originalVendors = [];
  late DateTime time;
  @override
  void initState() {
    super.initState();
    openHiveBox();
    retrieveData();
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    vendorBox = await Hive.openBox<Vendor>('vendor');
  }

  Future<void> retrieveData() async {
    
    
    vendors = vendorBox?.values.toList() ?? [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/vendors.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      List<Vendor> newVendors = [];
      lines.forEach((line) {
        final vendorData = line.split(',');
        final vendor = Vendor(
          vendorName: vendorData[0],
          date: vendorData[1],
          note: vendorData[2],
          isComplete: vendorData[3] == 'true',
          timestamp: DateTime.tryParse(vendorData[6]),
        );

        if (vendor.timestamp == null) {
          vendor.timestamp = DateTime(0);
          time = "null" as DateTime;
        } else {
          // time = Vendor.timestamp!.toIso8601String();
          time = DateFormat('yyyy-MM-dd').format(vendor.timestamp!) as DateTime;
          time = time.toString() as DateTime;
        }
        //print(vendor.isComplete);
        // Vendors.add(Vendor);
        newVendors.add(vendor);
      });
      setState(() {
        vendors = newVendors;
        originalVendors = newVendors.toList();
      });
    } else {
      setState(() {
        vendors = [];
      });
    }

    // Update the UI
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  String sort = 'accentOrder';
  String filter = 'all';

  List<Vendor>? sortVendorByMethod(String method) {
    setState(() {
      if (method == 'accent') {
        return vendors.sort((a, b) => a.vendorName.compareTo(b.vendorName));
      } else if (method == 'deaccent') {
        return vendors.sort((a, b) => b.vendorName.compareTo(a.vendorName));
      } else if (method == 'newestFirst') {
        return vendors.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
      } else if (method == 'oldestFirst') {
        return vendors.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      }
    });
    return null;
  }

  void filterVendorsByMethod(String method) {
    setState(() {
      // Vendors = newVendors;
      if (method == 'completed') {
        vendors = originalVendors.where((Vendor) => Vendor.isComplete).toList();
      } else if (method == 'pending') {
        // Vendors = newVendors;
        vendors = originalVendors.where((Vendor) => !Vendor.isComplete).toList();
      } else {
        // Reset the Vendors list to show all Vendors
        retrieveData();
      }
      // Vendors = newVendors;
    });
  }

//////////////////////sort Vendor ////////////////////////////////////////////
////////////////////////////////////////////////////////////////
///////////////////////////////////////////////

  void sortVendor() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "\u2B07 A-Z",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "accent",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortVendorByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "\u2B06 Z-A",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "deaccent",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortVendorByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    selected: true,
                    title: Text(
                      "Newest Vendor First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "newestFirst",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortVendorByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Oldest Vendor First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "oldestFirst",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        sortVendorByMethod(sort);
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

// Filter function
/////////////////////////Filter Vendor//////////////////////////////
/////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

  filterVendor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "All Vendors",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "all",
                    groupValue: filter,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        filter = value.toString();

                        filterVendorsByMethod(filter);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Completed Vendor Only",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "completed",
                    activeColor: Colors.black87,
                    groupValue: filter,
                    onChanged: (value) {
                      setState(() {
                        filter = value.toString();
                        filterVendorsByMethod(filter);
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Pending Vendor Only",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "pending",
                    activeColor: Colors.black87,
                    groupValue: filter,
                    onChanged: (value) {
                      setState(() {
                        filter = value.toString();
                        filterVendorsByMethod(filter);
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  /////////////////////deleteVendor//////////////////////////
  ///////////////////////////////////////////////
  /////////////////////////////////////////////////////

  static Future<void> deleteVendor(String vendorKey) async {
    final vendorBox = await Hive.openBox<Vendor>('vendor');

    if (vendorBox.containsKey(vendorKey)) {
      vendorBox.delete(vendorKey);
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/vendor.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final vendorData = line.split(',');
        final vendorNameInFile = vendorData[0];
        return vendorNameInFile != vendorKey;
      }).toList();

      await file.writeAsString(updatedLines.join('\n'));
    }
  }

  // // ////////////////////Edit or delete////////////////////////////
  // /////////////////////////////////////////////////////////

  editOrDelete(String key) {
    // String vendorName = key;
    String vendorName = key;

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
                      final updatedVendor = await Navigator.pushNamed(
                          context, '/addVendor',
                          arguments: vendorName);
                      retrieveData();
                      // if (updatedVendor != null) {
                      //   // If a new Vendor is added, update the data and refresh the UI
                      //   setState(() {
                      //     Vendors.add(updatedVendor as Vendor);
                      //   });
                      // }

                      Navigator.pop(context, updatedVendor);
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
                      await deleteVendor(vendorName);
                      retrieveData();
                      Navigator.pop(context, null);
                      // deleteVendor(vendorName);
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
  // var Vendors = VendorBox.values.toList();

  //show dialogbox
  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         backgroundColor: Colors.green, // Set the dialog background color
  //         title: Text(
  //           'Choose an Option',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Close the dialog
  //                 // Perform the action for the first button here
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Colors.green,
  //               ),
  //               child: Text(
  //                 'Button 1',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Close the dialog
  //                 // Perform the action for the second button here
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Colors.green,
  //               ),
  //               child: Text(
  //                 'Button 2',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> VendorList = retriveVendor();

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
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Vendor List',
                    style: TextStyle(
                      fontSize: width * 0.07,
                      // fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          body: vendors.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 20, 24, 26),
                    image: DecorationImage(
                      image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 200),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/Images/Vendors/emptyVendor.png"),
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
                    itemCount: vendors.length,
                    itemBuilder: (context, index) {
                      final vendor = vendors[index];

                      return SizedBox(
                        height: 70.0,
                        child: Container(
                          // color: Color.fromARGB(255, 20, 24, 26),
                          padding: EdgeInsetsDirectional.zero,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white12, width: 0.0
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
                                    vendor.vendorName,

                                    //  "${Vendor.timestamp?.minute?.toString()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  textColor: Colors.white,
                                  // trailing: Text(
                                  //   time,
                                  // ),
                                  onTap: () async {
                                    Navigator.pushNamed(context, 'viewVendor',
                                        arguments: vendor);
                                    // setState(() {
                                    //   retrieveData();
                                    // });
                                  },
                                  onLongPress: () async {
                                    final updatedVendor =
                                        editOrDelete(vendor.vendorName);
                                    if (updatedVendor != null) {
                                      setState(() {
                                        retrieveData();
                                      });
                                    }
                                  //   // await retrieveData();
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(width: 3, color: Colors.white),
            //   borderRadius: BorderRadius.circular(100)),
            onPressed: () async {
              Navigator.pushNamed(context, 'addVendor');
              final newVendor = await Navigator.pushNamed(context, 'addVendor');
              if (newVendor != null) {

                setState(() {
                  vendors.add(newVendor as Vendor);
                });
              }
              await retrieveData();
            },
            child: Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            //to add curve margin around floating action button . use notcMargin. default is 4
            notchMargin: 4,

            clipBehavior: Clip.antiAlias,

            // use about attribute to get the curve shape for notchMargin
            shape: CircularNotchedRectangle(),
            // ← carves notch for FAB in BottomAppBar
            color: Color.fromARGB(255, 18, 140, 126),
            //  Theme.of(context).primaryColor.withAlpha(0),

            // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
            elevation:
                8, // ← removes slight shadow under FAB, hardly noticeable
            // ↑ default elevation is 8. Peek it by setting color ↑ alpha to 0
            child: BottomNavigationBar(
              // ***** NAVBAR  *************************
              elevation: 1, // 0 removes ugly rectangular NavBar shadow
              // CRITICAL ↓ a solid color here destroys FAB notch. Use alpha 0!
              backgroundColor: Color.fromARGB(255, 18, 140, 126),
              // Theme.of(context).primaryColor.withAlpha(0),
              // ====================== END OF INTERESTING STUFF =================
              selectedItemColor: Theme.of(context).colorScheme.onSurface,

              onTap: (int index) {
                setState(() {
                  if (index == 0) {
                    sortVendor();
                  } else if (index == 1) {
                    //filterVendor(context);
                  }
                });
              },

              items: [
                BottomNavigationBarItem(

                    // backgroundColor: Colors.black,
                    icon: Icon(
                      Icons.sort,
                      size: 40,
                      color: Colors.black,
                      //  Theme.of(context).colorScheme.onBackground
                    ),
                    label: 'Sort'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.filter_alt,
                      size: 40,
                      color: Colors.black,
                      // Theme.of(context).colorScheme.onBackground
                    ),
                    label: 'Filter')
              ],
            ),
          )),
    );
  }

  Widget buildContent(List<Vendor> vendor) {
    if (vendor.isEmpty) {
      return Center(
          child: FloatingActionButton(
              heroTag: 'addVendor',
              onPressed: () {
                // Navigator.pushNamed(context, '/addVendor');
              }));
    } else {
      return Center(
        child: Text('UnderDeveloped'),
      );
    }
  }
}
