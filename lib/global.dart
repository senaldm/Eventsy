import 'package:hive/hive.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';
// Declare the global variable

// late Box<BudgetEvent> eventbudgetBox;
// late Box<BudgetEvent> taskbudgetBox;

late Box<Event> eventBox;

late Box<Task> taskBox;

late Box<EventTasks> eventTaskBox;

late Box<BudgetTasks> budgetTaskBox;
late Box<Invitation> invitationBox;

late Box<UserMode> userModeBox;

late Box<ValidationBackMethod> validationbackMethodBox;

// Future<void> addEvent(Eventset eventName) async {
//   eventsBox.add(eventName);

// }

