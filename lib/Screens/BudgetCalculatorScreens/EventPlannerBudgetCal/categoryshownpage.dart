import 'package:eventsy/Model/Event.dart';
import 'package:flutter/material.dart';
import 'package:eventsy/Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/eventselectionpage.dart';
import 'package:eventsy/global.dart';

class CategoryShownPage extends StatefulWidget {
  CategoryShownPage({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryShownPageState createState() => _CategoryShownPageState();
}

class _CategoryShownPageState extends State<CategoryShownPage> {
  String? eventName;
  int? targetBudget;
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    retrieveEventName();
  }

  void retrieveEventName() {
    final budgetEvent = eventbudgetBox.get("budgetevent");
    if (budgetEvent != null) {
      setState(() {
        eventName = budgetEvent.eventName;
        targetBudget = budgetEvent.targetBudget;
      });
      retrieveCategories();
    }
  }

  void retrieveCategories() {
    final categoryList = eventTaskBox.values.toList();
    setState(() {
      categories.clear();
      categories.addAll(categoryList
          .where((category) => category.eventName == eventName)
          .map((category) => category.categoryName));
    });
  }

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
                          addCategory(
                            categoryName,
                            vendorName,
                            eventName,
                            totalPrice,
                          );
                          Navigator.of(context).pop();
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          controller: PageController(initialPage: 300),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: const EdgeInsets.only(right: 60)),
                ElevatedButton(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 200),
                ),
                for (var category in categories)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 5.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 20),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
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

  void addCategory(String? categoryName, String? vendorName, String? eventName,
      int? totalPrice) {
    if (categoryName != null &&
        vendorName != null &&
        eventName != null &&
        totalPrice != null) {
      final category = BudgetTask(
          eventName: '',
          targetBudget: 0,
          categoryName: '',
          totalPrice: 0,
          vendorName: '');
      category.categoryName = categoryName;
      category.eventName = eventName;
      category.totalPrice = totalPrice;
      category.vendorName = vendorName;
      eventTaskBox.add(category as EventTasks);
      setState(() {
        retrieveCategories();
      });
    }
  }
}
