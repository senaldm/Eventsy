// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:eventsy/Model/Vendor/vendor.dart';
import 'package:eventsy/Screens/Task/User/vendors/deleteVendor.dart';
import 'package:flutter/material.dart';

class ViewVendor extends StatefulWidget {
  final Vendor vendor;

  const ViewVendor({required this.vendor});

  @override
  State<ViewVendor> createState() => _ViewVendorState();
}

class _ViewVendorState extends State<ViewVendor> {
  late Vendor currentVendor;
  late String vendorName;
  late String date;
  late String note;
  late bool isComplete;
  @override
  void initState() {
    super.initState();
    currentVendor = widget.vendor;
    vendorName = currentVendor.vendorName;
    date =currentVendor.date.toString();
    note = currentVendor.note;
    isComplete = currentVendor.isComplete;
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
              currentVendor.vendorName,
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Deletevendor.deletevendor(currentVendor.vendorName);

                  Navigator.pushNamed(context, 'VendorList');
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () async {
                  final updatedVendor = await Navigator.pushNamed(
                      context, 'addVendor',
                      arguments: currentVendor);
                  if (updatedVendor != null) {
                    // ignore: use_build_context_synchronously
                    currentVendor = updatedVendor as Vendor;
                  }
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            await Navigator.pushNamed(context, 'VendorList');
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
                        'Vendor Details',
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
                        title: Text('Vendor Name'),
                        subtitle: Text(vendorName),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.date_range_outlined),
                        title: Text('Date'),
                        subtitle: Text(date),
                      ),
                        ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.note_add),
                        title: Text('Note'),
                        subtitle: Text(note),
                      ),
                      ListTile(
                        iconColor: Colors.white70,
                        textColor: Colors.white,
                        leading: Icon(Icons.check),
                        title: Text('Is confirmed'),
                        subtitle: Text(isComplete ? 'Yes' : 'No'),
                      ),
                     
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 18, 140, 126),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'VendorList');
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

  void _markAsCompleted() {
    // Update the currentVendor's isComplete property
    currentVendor.isComplete = true;

    // Notify the userDashboard that a Vendor is completed
    Navigator.pop(context, true); // Pass 'true' as a result
  }
}
