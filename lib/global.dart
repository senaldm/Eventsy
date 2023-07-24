import 'package:hive/hive.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:eventsy/Model/Budget/eventbudget.dart';
// Declare the global variable

late Box<BudgetEvent> eventbudgetBox;
late Box<BudgetTask> taskbudgetBox;

late Box<Event> eventBox;

late Box<Task> taskBox;

late Box<EventTasks> eventTaskBox;

late Box<Invitation> invitationBox;

late Box<UserMode> userModeBox;

// Future<void> addEvent(Eventset eventName) async {
//   eventsBox.add(eventName);

// }

