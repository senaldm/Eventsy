import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:eventsy/Model/Event.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class BudgedAddedList extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  final String budgetKey = '';
  final List<BudgetTasks> budgetList;
  BudgedAddedList({Key? key, required this.budgetList}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BudgedAddedListState createState() => _BudgedAddedListState();
}

class _BudgedAddedListState extends State<BudgedAddedList> {
  late List<BudgetTasks> budgetlist;
  late final String budgetKey;
  Box<BudgetTasks>? budgetTaskBox;
  List<BudgetTasks> budgetTasks = [];
  List<BudgetTasks> originalBudgetTasks = [];

  get height => null;

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    budgetTaskBox = await Hive.openBox<BudgetTasks>('budgettask');
  }

  Future<void> retrieveData() async {
    // Retrieve data from eventTaskBox
    budgetTasks = budgetTaskBox?.values
            .where((budgetTask) => budgetTask.budgetKey == budgetKey)
            .toList() ??
        [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgetTask.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      List<BudgetTasks> newTasks = [];
      lines.forEach((line) {
        final budgetData = line.split(',');
        final budgettask = BudgetTasks(
          budgetKey: budgetData[0],
          taskKey: budgetData[1],
          taskName: budgetData[2],
          actualBudget: budgetData[3],
          budget: budgetData[4],
          vendorName: budgetData[5],
          categoryName: budgetData[6],
        );

        newTasks.add(budgettask);
      });

      setState(() {
        budgetTasks = newTasks;
        originalBudgetTasks = newTasks.toList();
      });
    } else {
      setState(() {
        budgetTasks = [];
      });
    }
    print("Retrieved Budget Tasks: $budgetTasks");
  }

  @override
  void initState() {
    super.initState();
    openHiveBox();
    retrieveData();
  }

  @override
  void dispose() {
    budgetTaskBox?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // currentIndex:selected;
    final budgetList =
        ModalRoute.of(context)?.settings.arguments as List<BudgetTasks>;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).viewInsets.bottom != 0.0;
    // final List<String> BudgedAddedList = retriveTask();

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
              child: Text('Budget Added Task List',
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
            Navigator.popUntil(context, ModalRoute.withName('BudgetTaskList'));
            return false;
          },
          child: budgetTasks.isEmpty
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
                    itemCount: originalBudgetTasks.length,
                    itemBuilder: (context, index) {
                      final budget = originalBudgetTasks[index];

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
                                    budget.taskName,

                                    //  "${task.timestamp?.minute?.toString()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  textColor: Colors.white,
                                  onTap: () async {
                                    Navigator.pushNamed(
                                        context, 'ViewBudgetTask',
                                        arguments: budget);

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