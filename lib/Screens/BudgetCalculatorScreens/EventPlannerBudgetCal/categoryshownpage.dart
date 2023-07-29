import 'dart:io';

import 'package:eventsy/Model/Event.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/global.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CategoryShownPage extends StatefulWidget {
  CategoryShownPage({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryShownPageState createState() => _CategoryShownPageState();
}

class _CategoryShownPageState extends State<CategoryShownPage> {
  void initState() {
    super.initState();
    openHiveBox();
    retrieveData();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the arguments when the page is built
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      eventName = arguments['eventName'] as String?;
      targetBudget = arguments['targetBudget'] as int?;
      retrieveData();
    }
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    eventbudgetBox = await Hive.openBox<BudgetEvent>('budgetevent');
    taskbudgetBox = await Hive.openBox<BudgetTask>('budgettask');
  }

  Future<void> retrieveData() async {
    // Retrieve data from Hive box
    category = taskbudgetBox?.values.toList() ?? [];

    // Retrieve data from local storage
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgettask.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      lines.forEach((line) {
        final data = line.split(',');
        final budgettask = BudgetTask(
          categoryName: data[0],
          vendorName: data[1],
          totalPrice: int.parse(data[2]),
          eventName: data[3],
          targetBudget: int.parse(data[4]),
        );

        category.add(budgettask);
      });
    }
    eventName = eventbudgetBox.get('budgetEventKey')?.eventName;
    targetBudget = eventbudgetBox.get('budgetEVentKey')?.targetBudget;
    setState(() {}); // Update the UI
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  final eventCategoryController = TextEditingController();
  final vendorNameController = TextEditingController();
  final totalPriceContoller = TextEditingController();

  String? eventName;
  int? targetBudget;
  final _formKey = GlobalKey<FormState>();
  List<BudgetTask> category = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    void _showCategoryPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String? categoryName;
          String? vendorName;
          int? totalPrice;

          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              'Add Category',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            content: Container(
              width: width * 0.8,
              height: height * 0.5,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    DropdownButtonFormField<String>(
                      onChanged: (String? newValue) {
                        setState(() {
                          categoryName = newValue;
                        });
                      },
                      value: categoryName,
                      items: <String>[
                        'Decoration',
                        'Food and Beverages',
                        'Option 3',
                        'Option 4',
                        'Option 5',
                        'Option 6',
                        'Option 7',
                        'Option 8',
                        'Option 9',
                        'Option 11',
                        'Option 12',
                        'Option 13',
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
                        'Add Category',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      focusColor: Colors.grey,
                      dropdownColor: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Add Vendor',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: Colors.grey,
                      width: width * 0.8,
                      child: TextField(
                        controller: vendorNameController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          vendorName = value;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "",
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Add Budget',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: Colors.grey,
                      width: width * 0.8,
                      child: TextField(
                        controller: totalPriceContoller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          totalPrice = int.tryParse(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "",
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            addCategory(categoryName!, eventName!, vendorName!,
                                totalPrice!, targetBudget!);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade900,
                            minimumSize: const Size(100, 50),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade900,
                            minimumSize: const Size(100, 50),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
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
                eventName ?? '',
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: Container(
            decoration:const  BoxDecoration(
              color: Color.fromARGB(255, 20, 24, 26),
              image: DecorationImage(
                image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              controller: PageController(initialPage: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const  Padding(padding: const EdgeInsets.only(right: 60)),
                  Padding(
                    padding: const EdgeInsets.only(top:30,right: 40),
                    child: ElevatedButton(
                      onPressed: () async {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          './CategoryDetailsShownPage',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade900,
                          minimumSize: Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        ' View Details ',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsetsDirectional.zero,
                      shrinkWrap: false,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        final task = category[index];

                        return SizedBox(
                          height: 70.0,
                          child: Container(
                            // color: Color.fromARGB(255, 20, 24, 26),
                            padding: EdgeInsetsDirectional.zero,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white12, width: 0.0
                                        //  Theme.of(context).dividerColor
                                        ))),
                            margin: const EdgeInsets.only(
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
                                      "    ${task.categoryName}",

                                      //  "${task.timestamp?.minute?.toString()}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                    textColor: Colors.white,
                                    onTap: () {
                                      // Handle task item tap
                                    },
                                    onLongPress: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          color: Colors.greenAccent.shade700,
          height: 90,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      _showCategoryPopup();
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green.shade900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addCategory(String categoryName, String eventName, String vendorName,
      int totalPrice, int targetBudget) async {
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // final filePath = '${appDocumentDir.path}/tasks.txt';
    taskbudgetBox = (await Hive.openBox<BudgetTask>('budgettask'));

    if (_formKey.currentState!.validate()) {
      vendorName = vendorNameController.text;
      totalPrice = totalPriceContoller.text as int;

      // Create a new Task object
      final category = BudgetTask(
        categoryName: categoryName,
        vendorName: vendorName,
        totalPrice: totalPrice,
        eventName: eventName,
        targetBudget: targetBudget,
      );

      // Store the task in Hive
      storeCategory(category);

      // Clear form data

      vendorNameController.clear();
      totalPriceContoller.clear();
    }
  }

  Future<void> storeCategory(BudgetTask category) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/budgettask.txt');
    final exists = await file.exists();

    if (!exists) {
      await file.create();
    }

    final categoryData =
        '${category.categoryName},${category.vendorName},${category.totalPrice},${category.eventName},${category.targetBudget},';
    await file.writeAsString(categoryData, mode: FileMode.append);
  }
}
