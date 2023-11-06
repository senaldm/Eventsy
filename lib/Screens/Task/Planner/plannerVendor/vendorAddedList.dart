import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/plannerVendor/plannerVendor.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VendorAddedList extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  final String vendorKey = '';
  final List<VendorTasks> vendorList;
  VendorAddedList({Key? key, required this.vendorList}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VendorAddedListState createState() => _VendorAddedListState();
}

class VendorTasks {
  get vendorKey => null;

    String taskName;

    VendorTasks({
    required this.taskName,
    // Add other properties as needed
  });



}

class _VendorAddedListState extends State<VendorAddedList> {
  late List<VendorTasks> vendorlist;
  late final String vendorKey;
  Box<VendorTasks>? vendorTaskBox;
  List<VendorTasks> vendorTasks = [];
  List<VendorTasks> originalVendorTasks = [];

  get height => null;

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    vendorTaskBox = await Hive.openBox<VendorTasks>('Vendortask');
  }

  Future<void> retrieveData() async {
    // Retrieve data from eventTaskBox
    vendorTasks = vendorTaskBox?.values
            .where((vendorTask) => vendorTask.vendorKey == vendorKey)
            .toList() ??
        [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/VendorTask.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      List<VendorTasks> newTasks = [];
      lines.forEach((line) {
        final vendorData = line.split(',');
        final vendortask = VendorTask(
            eventKey: '', // Replace with the event key as needed
            eventName: '', // Replace with the event name as needed
            taskKey: vendorData[1],
            taskName: vendorData[2],
            vendorName: vendorData[5],
            date: null, 
            note: '', 
            taskTimestamp: DateTime(0),
          );
        newTasks.add(vendorTasks as VendorTasks);
      });

      setState(() {
        vendorTasks = newTasks;
        originalVendorTasks = newTasks.toList();
      });
    } else {
      setState(() {
        vendorTasks = [];
      });
    }
    print("Retrieved Vendor Tasks: $vendorTasks");
  }

  @override
  void initState() {
    super.initState();
    openHiveBox();
    retrieveData();
  }

  @override
  void dispose() {
    vendorTaskBox?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final vendorList =
        ModalRoute.of(context)?.settings.arguments as List<VendorTasks>;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> VendorAddedList = retriveTask();

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
              child: Text('Vendor Added Task List',
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
          onWillPop: () async {
            Navigator.popUntil(context, ModalRoute.withName('VendorTaskList'));
            return false;
          },
          child: vendorTasks.isEmpty
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
                    itemCount: originalVendorTasks.length,
                    itemBuilder: (context, index) {
                      final vendor = originalVendorTasks[index];

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
                                    vendor.taskName,

                                    //  "${task.timestamp?.minute?.toString()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  textColor: Colors.white,
                                  onTap: () async {
                                    Navigator.pushNamed(
                                        context, 'ViewVendorTask',
                                        arguments: vendor);

                                    // setState(() {
                                    //   retrieveData();
                                    // });
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
