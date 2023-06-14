import 'package:flutter/material.dart';
import 'package:eventsy/Screens/BudgetCalculatorScreens/eventselectionpage.dart';
import 'package:eventsy/global.dart';
import 'package:eventsy/Model/Budgetcal/eventset.dart';

// ignore: must_be_immutable
class CategoryShownPage extends StatefulWidget {
  var tasks;

  CategoryShownPage({
    Key? key,
  }) : super();
  // ignore: recursive_getters
  @override

  // ignore: library_private_types_in_public_api
  _CategoryShownPageState createState() => _CategoryShownPageState(this.tasks);
}

class _CategoryShownPageState extends State<CategoryShownPage> {
  String? categoryName;
  List<String> categories = [];
  List<SubTaskSet> tasks = [];

  _CategoryShownPageState(tasks);
  @override
  void initState() {
    super.initState();
    retrieveCategories();
  }

  void retrieveCategories() {
    final categoryList = categoryBox.values.toList();
    setState(() {
      categories.clear();
      categories.addAll(categoryList.map((category) => category.categoryName));
    });
    if (categories.isNotEmpty) {
      retrieveTasks(categories[0]);
    }
  }

  void retrieveTasks(String categoryName) {
    final taskList = taskBox.values
        .where((task) => task.categoryName == categoryName)
        .toList();
    setState(() {
      tasks.clear();
      tasks.addAll(taskList);
    });
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    void _showCategoryPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Select Category',
              style:
                  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
            ),
            content: Container(
              // color: Colors.grey.shade900,
              width: width * 0.8,
              height: height * 0.19,
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Container(
                          child: SingleChildScrollView(
                            child: DropdownButtonFormField<String>(
                              onChanged: (String? newValue) {
                                setState(() {
                                  categoryName = newValue;
                                });
                              },
                              items: <String>[
                                'Decoration',
                                'Food and Beverages',
                                ' Option 3',
                                ' Option 4',
                                ' Option 5',
                                ' Option 6',
                                ' Option 7',
                                ' Option 8',
                                ' Option 9',
                                ' Option 11',
                                ' Option 12',
                                ' Option 13',
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
                                        style: TextStyle(color: Colors.white),
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
                                style: TextStyle(color: Colors.black),
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          addCategory(categoryName);
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          '  Save ',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900,
                          minimumSize: Size(100, 50),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel ',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900,
                          minimumSize: Size(100, 50),
                        ),
                      ),
                    ],
                  ),
                ],
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

          // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Colors.greenAccent.shade700,
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text(
                  eventsBox.containsKey("events")
                      ? eventsBox.get("events")!.eventName
                      : '',
                  style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          controller: PageController(initialPage: 300),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 200),
                child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, './CategoryDetailsShownPage',
                              arguments: eventsBox.get("events")?.eventName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900,
                          minimumSize: Size(100, 50),
                        ),
                        child: Text(
                          'View Details',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ))),
              ),
              for (var category in categories)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 5.0,
                    )),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: Container(
                            // width: width * 0.8,
                            child: Text(
                              category,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        for (var task in tasks)
                          if (task.categoryName == category)
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                                top: 10,
                              ),
                              child: Text(
                                task.taskName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, top: 10, left: 120),
                          child: Container(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, './NormalBudgetOptionPage',
                                        arguments: category);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.shade900,
                                  ),
                                  child: Text(
                                    'Add Task',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          color: Colors.greenAccent.shade700,
          height: 90,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  _showCategoryPopup();
                },
                // ignore: prefer_const_constructors
                child: Icon(Icons.add),
                backgroundColor: Colors.green.shade900,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addCategory(String? categoryName) async {
    if (categoryName != null) {
      final category = CategorySet();
      category.categoryName = categoryName;
      categoryBox.add(category);
      retrieveCategories();
    }
  }
}
