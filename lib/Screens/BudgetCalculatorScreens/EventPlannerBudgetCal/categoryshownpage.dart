// import 'dart:io';

// import 'package:eventsy/Model/Event.dart';
// import 'package:flutter/material.dart';
// import 'package:eventsy/global.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:uuid/uuid.dart';

// class CategoryShownPage extends StatefulWidget {
//   CategoryShownPage({
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   @override
//   _CategoryShownPageState createState() => _CategoryShownPageState();
// }

// class _CategoryShownPageState extends State<CategoryShownPage> {
//   late Box<BudgetEvent> taskbudgetBox;
//   List<BudgetEvent> budgetTask = [];
//   List<BudgetEvent> originalbudgetTask = [];

//   String? eventKey;
//   final eventCategoryController = TextEditingController();
//   final vendorNameController = TextEditingController();
//   final totalPriceContoller = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     openHiveBox();
//     retrieveData();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Retrieve the arguments when the page is built
//     final Map<String, dynamic>? arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     if (arguments != null) {
//       eventName =
//           arguments['eventName'] as String? ?? ''; // Provide default value
//       targetBudget = arguments['targetBudget'] as String? ?? '';
//       eventKey = arguments['eventKey'] as String? ?? '';
//       // Provide default value
//       /// retrieveData();
//     }
//   }

//   Future<void> openHiveBox() async {
//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocumentDir.path);
//     eventbudgetBox = await Hive.openBox<BudgetEvent>('budgetevent');
//     taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');
//   }

//   Future<void> retrieveData() async {
//     // Retrieve data from Hive box
//     budgetTask = taskbudgetBox?.values.toList() ?? [];

//     // Retrieve data from local storage
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/budgettask.txt');
//     if (await file.exists()) {
//       final lines = await file.readAsLines();
//       List<BudgetEvent> newCategory = [];
//       for (var line in lines) {
//         final data = line.split(',');
//         final budgettask = BudgetEvent(
//           taskeventKey: data[0],
//           categoryName: data[1],
//           vendorName: data[2],
//           totalPrice: data[3],
//           eventName: data[4],
//           targetBudget: data[5],
//           eventKey: data[6],
//         );

//         newCategory.add(budgettask);
//       }

//       // Filter the data based on the current eventName
//       final filteredCategory =
//           newCategory.where((task) => task.eventName == eventName).toList();

//       setState(() {
//         budgetTask = filteredCategory;
//       });
//     } else {
//       setState(() {
//         budgetTask = [];
//       });
//     }

//     eventName = eventbudgetBox.get('budgetEventKey')!.eventName;
//     targetBudget = eventbudgetBox.get('budgetEventKey')!.targetBudget;
//     // Update the UI
//   }

//   @override
//   void dispose() {
//     Hive.close();
//     super.dispose();
//   }

//   String eventName = '';
//   String targetBudget = '';
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     // ignore: no_leading_underscores_for_local_identifiers
//     void _showCategoryPopup() {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           String? categoryName;
//           String? vendorName = '';
//           int? totalPrice = 0;

//           return Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   AlertDialog(
//                     backgroundColor: Color.fromARGB(255, 18, 140, 126),
//                     title: const Text(
//                       'Add Category',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     content: Container(
//                       width: width * 0.8,
//                       height: height * 0.5,
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           children: <Widget>[
//                             DropdownButtonFormField<String>(
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   categoryName = newValue;
//                                 });
//                               },
//                               // value: categoryName,
//                               items: <String>[
//                                 'Decoration',
//                                 'Food and Beverages',
//                                 'Option 3',
//                                 'Option 4',
//                                 'Option 5',
//                                 'Option 6',
//                                 'Option 7',
//                                 'Option 8',
//                                 'Option 9',
//                                 'Option 11',
//                                 'Option 12',
//                                 'Option 13',
//                               ].map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: SizedBox(
//                                     width: 290,
//                                     height: 60,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         value,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               isExpanded: true,
//                               hint: const Text(
//                                 'Add Category',
//                                 style: TextStyle(color: Colors.white),
//                                 textAlign: TextAlign.center,
//                               ),
//                               icon: const Icon(
//                                 Icons.arrow_drop_down,
//                                 color: Colors.white,
//                               ),
//                               decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade900,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               focusColor: Colors.grey,
//                               dropdownColor: Colors.grey,
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Add Vendor',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Container(
//                               color: Colors.grey,
//                               width: width * 0.8,
//                               child: TextField(
//                                 controller: vendorNameController,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 onChanged: (value) {
//                                   vendorName = value;
//                                 },
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.grey,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   hintText: "",
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Add Budget',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Container(
//                               color: Colors.grey,
//                               width: width * 0.8,
//                               child: TextField(
//                                 controller: totalPriceContoller,
//                                 keyboardType: TextInputType.number,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 onChanged: (value) {
//                                   totalPrice = int.tryParse(value);
//                                 },
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.grey,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   hintText: "",
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Spacer(
//                               flex: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () async {
//                                     if (categoryName != null &&
//                                         vendorName != null &&
//                                         totalPrice != null) {
//                                       // Perform additional checks for null

//                                       await addCategory(
//                                         categoryName!,
//                                         eventName,
//                                         vendorNameController.text,
//                                         totalPriceContoller.text,
//                                         targetBudget,
//                                       );
//                                       Navigator.of(context).pop();
//                                       retrieveData();
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Color.fromARGB(255, 2, 56, 51),
//                                     minimumSize: const Size(100, 50),
//                                   ),
//                                   child: const Text(
//                                     'Save',
//                                     style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Roboto',
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Color.fromARGB(255, 2, 56, 51),
//                                     minimumSize: const Size(100, 50),
//                                   ),
//                                   child: const Text(
//                                     'Cancel',
//                                     style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'Roboto',
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     }

//     Future<void> deleteTask(String categoryKey) async {
//       final taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');

//       if (taskbudgetBox.containsKey(categoryKey)) {
//         taskbudgetBox.delete(categoryKey);
//       }

//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/budgettask.txt');
//       if (await file.exists()) {
//         final lines = await file.readAsLines();
//         final updatedLines = lines.where((line) {
//           final data = line.split(',');
//           final taskKeyInFile = data[0];
//           return taskKeyInFile != categoryKey;
//         }).toList();

//         await file.writeAsString(updatedLines.join('\n'));
//       }
//     }

//     editOrDelete(String key) {
//       String taskbudgetKey = key.trim();
//       print('Attempting to delete task with key: $taskbudgetKey');
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15.0)),
//             ),
//             content: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     editCategory(taskbudgetKey);
//                     retrieveData();
//                     //Navigator.pop(context, null);
//                     // Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 7, 94, 84),
//                   ),
//                   child: Text(
//                     " Edit ",
//                     style: TextStyle(
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await deleteTask(taskbudgetKey);
//                     retrieveData();
//                     Navigator.pop(context, null);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 7, 94, 84),
//                   ),
//                   child: const Text(
//                     "Delete",
//                     style: TextStyle(
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }

//     BudgetEvent? getCategoryDetails(String categoryKey) {
//       return budgetTask.firstWhere(
//         (task) => task.taskeventKey == categoryKey,
//       );
//     }

//     void showDetails(String categoryKey) {
//       final selectedCategory = getCategoryDetails(categoryKey);
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return Center(
//               child: SingleChildScrollView(
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                     AlertDialog(
//                       backgroundColor: Color.fromARGB(255, 18, 140, 126),
//                       title: const Text(
//                         'Category  Details',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                           color: Colors.white,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       content: Container(
//                         width: width * 0.8,
//                         height: height * 0.45,
//                         child: Column(
//                           children: <Widget>[
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               margin: EdgeInsets.only(
//                                   top: width * 0.05, bottom: width * 0.05),
//                               borderOnForeground: false,
//                               child: Hero(
//                                 tag: 'categoryName',
//                                 child: SizedBox(
//                                   width: width * 1.5,
//                                   height: height * 0.08,
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Icon(
//                                         Icons.category_outlined,
//                                         color: Colors.blue,
//                                       ),
//                                       SizedBox(
//                                         width: 50,
//                                       ),
//                                       Text(
//                                         ' ${selectedCategory?.categoryName ?? ''}',
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Rest of the code remains the same.
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               margin: EdgeInsets.only(
//                                   top: width * 0.05, bottom: width * 0.05),
//                               borderOnForeground: false,
//                               child: Hero(
//                                 tag: 'vendorName',
//                                 child: SizedBox(
//                                   width: width * 1.5,
//                                   height: height * 0.08,
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Icon(
//                                         Icons.task_outlined,
//                                         color: Colors.blue,
//                                       ),
//                                       SizedBox(
//                                         width: 50,
//                                       ),
//                                       Text(
//                                         '${selectedCategory?.vendorName ?? ''}',
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               margin: EdgeInsets.only(
//                                   top: width * 0.05, bottom: width * 0.05),
//                               borderOnForeground: false,
//                               child: Hero(
//                                 tag: 'vendorName',
//                                 child: SizedBox(
//                                   width: width * 1.5,
//                                   height: height * 0.08,
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Icon(
//                                         Icons.attach_money_rounded,
//                                         color: Colors.blue,
//                                       ),
//                                       SizedBox(
//                                         width: 50,
//                                       ),
//                                       Text(
//                                         '${selectedCategory?.totalPrice ?? ''}',
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     height: height * 0.05,
//                                     width: width * 0.4,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                             Color.fromARGB(255, 7, 94, 84),
//                                       ),
//                                       child: const Text(
//                                         "Done",
//                                         style: TextStyle(
//                                           color: Colors.black87,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )

//                             // Rest of the code remains the same.
//                           ],
//                         ),
//                       ),
//                     ),
//                   ])),
//             );
//           });
//     }

//     return SafeArea(
//       child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.blueGrey.shade900,
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(height * 0.1),
//             child: AppBar(
//               titleSpacing: 2.2,
//               forceMaterialTransparency: false,
//               backgroundColor: Color.fromARGB(255, 18, 140, 126),
//               automaticallyImplyLeading: true,
//               centerTitle: true,
//               flexibleSpace: Center(
//                 child: Text(
//                   eventName ?? '',
//                   style: TextStyle(
//                     fontSize: width * 0.08,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           body: Container(
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 20, 24, 26),
//               image: DecorationImage(
//                 image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: ListView.builder(
//                       padding: EdgeInsetsDirectional.zero,
//                       shrinkWrap: false,
//                       itemCount: budgetTask.length,
//                       itemBuilder: (context, index) {
//                         final task = budgetTask[index];

//                         return SizedBox(
//                           height: 70.0,
//                           child: Container(
//                             // color: Color.fromARGB(255, 20, 24, 26),
//                             padding: EdgeInsetsDirectional.zero,
//                             decoration: const BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         color: Colors.white12, width: 0.0
//                                         //  Theme.of(context).dividerColor
//                                         ))),
//                             margin: const EdgeInsets.only(
//                                 left: 10.0, right: 10.0, bottom: 0, top: 0),
//                             // color: Color.fromARGB(255, 20, 24, 26),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   // Add Expanded here
//                                   child: Card(
//                                     color:
//                                         const Color.fromARGB(255, 20, 24, 26),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                     child: ListTile(
//                                       leading: Text(
//                                         task.categoryName,
//                                         textAlign: TextAlign.left,
//                                         style: const TextStyle(fontSize: 20.0),
//                                       ),
//                                       textColor: Colors.white,
//                                       onTap: () {
//                                         showDetails(task.taskeventKey);
//                                       },
//                                       onLongPress: () {
//                                         editOrDelete(task.taskeventKey);
//                                         retrieveData();
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: Color.fromARGB(255, 18, 140, 126),
//             // shape: RoundedRectangleBorder(
//             //   side: BorderSide(width: 3, color: Colors.white),
//             //   borderRadius: BorderRadius.circular(100)),
//             onPressed: () async {
//               // Navigator.pushNamed(context, 'addTask');
//               _showCategoryPopup();
//             },
//             child: Icon(
//               Icons.add,
//               color: Colors.black87,
//             ),
//           ),
//           bottomNavigationBar: BottomAppBar(
//             //to add curve margin around floating action button . use notcMargin. default is 4
//             notchMargin: 4,

//             clipBehavior: Clip.antiAlias,

//             // use about attribute to get the curve shape for notchMargin
//             shape: CircularNotchedRectangle(),
//             // ← carves notch for FAB in BottomAppBar
//             color: Color.fromARGB(255, 18, 140, 126),
//             //  Theme.of(context).primaryColor.withAlpha(0),

//             // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
//             elevation:
//                 8, // ← removes slight shadow under FAB, hardly noticeable
//             // ↑ default elevation is 8. Peek it by setting color ↑ alpha to 0
//             child: BottomNavigationBar(
//               // ***** NAVBAR  *************************
//               elevation: 1, // 0 removes ugly rectangular NavBar shadow
//               // CRITICAL ↓ a solid color here destroys FAB notch. Use alpha 0!
//               backgroundColor: Color.fromARGB(255, 18, 140, 126),
//               // Theme.of(context).primaryColor.withAlpha(0),
//               // ====================== END OF INTERESTING STUFF =================
//               selectedItemColor: Theme.of(context).colorScheme.onSurface,

//               items: [
//                 BottomNavigationBarItem(

//                     // backgroundColor: Colors.black,
//                     icon: Icon(
//                       Icons.sort,
//                       size: 40,
//                       color: Colors.black,
//                       //  Theme.of(context).colorScheme.onBackground
//                     ),
//                     label: 'Sort'),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.filter_alt,
//                       size: 40,
//                       color: Colors.black,
//                       // Theme.of(context).colorScheme.onBackground
//                     ),
//                     label: 'Filter')
//               ],
//             ),
//           )),
//     );
//   }

//   Future<void> addCategory(String categoryName, String eventName,
//       String newvendorName, String newtotalPrice, String targetBudget) async {
//     taskbudgetBox = (await Hive.openBox<BudgetEvent>('budgettask'));
//     if (_formKey.currentState!.validate()) {
//       newvendorName = vendorNameController.text;
//       newtotalPrice = totalPriceContoller.text;
//       final String uniqueKey = Uuid().v4();

//       // Create a new Task object
//       final category = BudgetEvent(
//         taskeventKey: uniqueKey,
//         categoryName: categoryName,
//         vendorName: newvendorName,
//         totalPrice: newtotalPrice,
//         eventName: eventName,
//         targetBudget: targetBudget,
//       );

//       await taskbudgetBox.put(uniqueKey, category);
//       // await taskbudgetBox.add(category);
//       // Store the task in Hive
//       await storeCategory(category);

//       // Clear form data
//       eventCategoryController.clear();
//       vendorNameController.clear();
//       totalPriceContoller.clear();
//     }
//   }

//   Future<void> storeCategory(BudgetEvent category) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/budgettask.txt');
//     final exists = await file.exists();

//     if (!exists) {
//       await file.create();
//     }

//     final categoryData =
//         '${category.taskeventKey},${category.categoryName},${category.vendorName},${category.totalPrice},${category.eventName},${category.targetBudget},';
//     await file.writeAsString('$categoryData\n', mode: FileMode.append);
//   }

//   void editCategory(String taskKey) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final height = MediaQuery.of(context).size.height;
//         final width = MediaQuery.of(context).size.width;
//         String? categoryName;
//         String? vendorName = '';
//         int? totalPrice = 0;

//         return Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 AlertDialog(
//                   backgroundColor: Color.fromARGB(255, 18, 140, 126),
//                   title: const Text(
//                     'Add Category',
//                     style: TextStyle(
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   content: Container(
//                     width: width * 0.8,
//                     height: height * 0.4,
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               margin: EdgeInsets.only(),

//                               borderOnForeground: false,
//                               // child:SingleChildScrollView(
//                               child: SizedBox(
//                                 width: width * 1.5,
//                                 child: DropdownButtonFormField<String>(
//                                   value: categoryName,
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       categoryName = newValue!;
//                                     });
//                                   },
//                                   items: <String>[
//                                     'Decoration',
//                                     'Food and Beverages',
//                                     ' Option 3',
//                                     ' Option 4',
//                                     ' Option 5',
//                                     ' Option 6',
//                                   ].map<DropdownMenuItem<String>>(
//                                       (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: SizedBox(
//                                         width: 290,
//                                         height: 60,
//                                         child: Align(
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             value,
//                                             style: TextStyle(
//                                                 color: Colors.black87),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     // fontSize: 20.0,
//                                   ),
//                                   isExpanded: true,
//                                   hint: const Text(
//                                     'Add Category',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   icon: const Icon(
//                                     Icons.arrow_drop_down,
//                                     color: Colors.black,
//                                   ),
//                                   decoration: InputDecoration(
//                                     fillColor: Colors.grey.shade900,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     prefixIcon: Icon(
//                                       Icons.category_outlined,
//                                     ),
//                                   ),
//                                   focusColor: Colors.white,
//                                   dropdownColor: Colors.blueGrey.shade900,
//                                 ),
//                               ),
//                             ),

//                             SizedBox(
//                               height: width * 0.08,
//                             ),

//                             SizedBox(
//                               height: width * 0.08,
//                             ),
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               margin: EdgeInsets.only(),
//                               borderOnForeground: false,
//                               child: Hero(
//                                 tag: 'vendorName',
//                                 child: SizedBox(
//                                   width: width * 1.5,
//                                   child: TextFormField(
//                                     controller: vendorNameController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return "Please enter a task name";
//                                       }
//                                       return null;
//                                     },
//                                     // onChanged: (value) {
//                                     //   vendorName:
//                                     //   value;
//                                     // },
//                                     decoration: InputDecoration(
//                                       border: UnderlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0)),
//                                       prefixIcon: Icon(Icons.task_outlined),
//                                       hintText: 'Vendor Name',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: width * 0.08,
//                             ),
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               margin: EdgeInsets.only(),
//                               borderOnForeground: false,
//                               child: Hero(
//                                 tag: 'totalPrice',
//                                 child: SizedBox(
//                                   width: width * 1.5,
//                                   child: TextField(
//                                     controller: totalPriceContoller,
//                                     keyboardType: TextInputType.number,
//                                     decoration: InputDecoration(
//                                       border: UnderlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0)),
//                                       prefixIcon:
//                                           Icon(Icons.attach_money_rounded),
//                                       hintText: ' TotalPrice ',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),

//                             //
//                             const SizedBox(height: 10),
//                             Spacer(),
//                             Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 FloatingActionButton.extended(
//                                   heroTag: Text('cancel'),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   backgroundColor: Colors.blueGrey.shade900,
//                                   label: const Text(
//                                     'Cancel',
//                                     style: TextStyle(
//                                         fontSize: 15.0,
//                                         // fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                                 FloatingActionButton.extended(
//                                   heroTag: Text('update'),
//                                   onPressed: () {
//                                     updateBudgetTask(
//                                       eventCategoryController.text,
//                                       vendorNameController.text,
//                                       totalPriceContoller.text,
//                                       //  eventName!,
//                                       // targetBudget!,
//                                     );

//                                     //trying to view the updated the task
//                                     retrieveData();
//                                     Navigator.pop(
//                                       context,
//                                     );

//                                     // Navigator.pushNamed(context, 'TaskList');
//                                   },
//                                   backgroundColor: Colors.blueGrey.shade900,
//                                   label: Text(
//                                     ' Update ',
//                                     style: TextStyle(
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ]),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   late String taskbudgetKey;
//   Future<void> updateBudgetTask(
//     String categoryName,
//     String vendorName,
//     String totalPrice,
//   ) async {
//     // final appDocumentDir = await getApplicationDocumentsDirectory();
//     // final filePath = '${appDocumentDir.path}/tasks.txt';
//     taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');

//     if (_formKey.currentState!.validate()) {
//       // Task? = taskBox?.get(taskKey);

//       // if (!= null) {
//       categoryName = eventCategoryController.text;
//       vendorName = vendorNameController.text;
//       totalPrice = totalPriceContoller.text;

//       // Create a new Task object
//       final task = BudgetEvent(
//         taskeventKey: taskbudgetKey,
//         categoryName: categoryName,
//         vendorName: vendorName,
//         totalPrice: totalPrice,
//       );
//       // Store the task in Hive
//       await taskbudgetBox?.put(taskbudgetKey, task);
//       await updateBudgetTaskInLocal(task);
//       // }
//       // Clear form data
//       // categoryController.clear();
//       eventCategoryController.clear();
//       vendorNameController.clear();
//       totalPriceContoller.clear();

//       print('Updated value:$task.vendorName');
//     }
//   }

//   Future<void> updateBudgetTaskInLocal(BudgetEvent task) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/budgettask.txt');
//     final exists = await file.exists();

//     if (!exists) {
//       await file.create();
//     }

//     final lines = await file.readAsLines();
//     final updatedLines = <String>[];

//     for (final line in lines) {
//       final taskData = line.split(',');
//       if (taskData[0] == task.taskeventKey) {
//         // Replace the line with the updated task data
//         final updatedTaskData =
//             '${task.taskeventKey},${task.categoryName},${task.vendorName},${task.totalPrice},${task.eventName},${task.targetBudget}';
//         updatedLines.add(updatedTaskData);
//       } else {
//         // Add other tasks as they are
//         updatedLines.add(line);
//       }
//       print(task.vendorName);
//     }
//     await file.writeAsString(updatedLines.join('\n'));
//   }
// }
