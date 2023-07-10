import 'package:hive/hive.dart';
import 'package:eventsy/Model/Budgetcal/eventset.dart';

// Declare the global variable
late Box<Eventset> eventsBox;

late Box<CategorySet> categoryBox;

late Box<SubTaskSet> taskBox;

Future<void> addEvent(Eventset eventName) async {
  eventsBox.add(eventName);
  // box.close();
}

var cateindex;
var categoryData = eventsBox.getAt(cateindex);
