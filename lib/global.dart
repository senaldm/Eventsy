import 'package:hive/hive.dart';
import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';

// Declare the global variable
late Box<Eventset> eventsBox;

late Box<CategorySet> categoryBox;

late Box<SubTaskSet> taskBox;

late Box<Event> eventBox;

late Box<Task> tasksBox;

late Box<EventTasks> eventTaskBox;

late Box<Invitation> invitationBox;

Future<void> addEvent(Eventset eventName) async {
  eventsBox.add(eventName);
  // box.close();
}

var cateindex;
var categoryData = eventsBox.getAt(cateindex);
