import 'package:hive/hive.dart';
// import 'package:hive_annotation/hive_annotation.dart';
part 'Event.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String taskKey;
  @HiveField(1)
  String categoryName;
  @HiveField(2)
  String taskName;
  @HiveField(3)
  String vendorName;
  @HiveField(4)
  late String budget;
  @HiveField(5)
  bool isComplete;
  @HiveField(6)
  DateTime? timestamp;

  void isCompleted() {
    isComplete = false;
  }

  Task({
    this.taskKey = '',
    this.categoryName = ' ',
    required this.taskName,
    this.vendorName = ' ',
    this.budget = ' ',
    this.isComplete = false,
    this.timestamp,
  });

  // const ConstDateTime(0)}) :this.timestamp = timestamp;
}

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  String eventKey;

  @HiveField(1)
  String eventName;

  @HiveField(2)
  DateTime? eventDate;

  @HiveField(3)
  String note;

  @HiveField(4)
  String venue;

  @HiveField(5)
  DateTime? timestamp;

  @HiveField(6)
  bool isEventComplete;

  Event({
    required this.eventKey,
    required this.eventName,
    this.eventDate,
    this.note = '',
    this.venue = '',
    this.timestamp,
    this.isEventComplete = false,
  });
}

@HiveType(typeId: 2)
class EventTasks extends Event {
  @HiveField(7)
  String taskKey;

  @HiveField(8)
  late String taskName;

  @HiveField(9)
  String vendorName;

  @HiveField(10)
  bool isComplete;

  @HiveField(11)
  String categoryName;

  @HiveField(12)
  String budget;

  @HiveField(13)
  DateTime taskTimestamp;

  EventTasks({
    required eventKey,
    required eventName,
    required this.taskKey,
    required this.taskName,
    this.vendorName = '',
    this.isComplete = false,
    this.categoryName = '',
    this.budget = '',
    required this.taskTimestamp,
  }) : super(
          eventKey: eventKey,
          eventName: eventName,
        );

  get actualBudget => null;
}

@HiveType(typeId: 3)
class BudgetTasks extends EventTasks {
  @HiveField(14)
  String budgetKey;
  @override
  @HiveField(15)
  String actualBudget;

  BudgetTasks({
    required this.budgetKey,
    required taskKey,
    required taskName,
    required this.actualBudget,
    required budget,
    required vendorName,
    required categoryName,
  }) : super(
          eventKey: '',
          eventName: '',
          taskTimestamp: DateTime(0),
          taskKey: taskKey,
          vendorName: vendorName,
          categoryName: categoryName,
          budget: budget,
          taskName: taskName,
        );
}

@HiveType(typeId: 4)
class Invitation extends Event {
  @HiveField(7)
  late String guestName;
  @HiveField(8)
  late bool isSend;

  Invitation({
    required String eventKey,
    required String eventName,
  }) : super(eventKey: eventKey, eventName: eventName);
}

@HiveType(typeId: 5)
class UserMode extends HiveObject {
  @HiveField(0)
  String userMode = 'default';
  @HiveField(1)
  bool isFirst = true;
  UserMode({required String userMode, required bool isFirst});
}

@HiveType(typeId: 6)
class ValidationBackMethod extends HiveObject {
  @HiveField(16)
  String backMethod = 'automatic';
  ValidationBackMethod({required String backMethod});
}

// @HiveType(typeId: 9)
// class VendorTask extends EventTasks {
//   @HiveField(16)
//   String vendorName;
//   @HiveField(17)
//   DateTime? date;
//   @HiveField(18)
//   String note;

//   VendorTask({
//     required eventKey,
//     required eventName,
//     required taskKey,
//     required taskName,
//     required this.vendorName,
//     this.date,
//     this.note = '',
//     required taskTimestamp,
//   }) : super(
//           eventKey: eventKey,
//           eventName: eventName,
//           taskKey: taskKey,
//           taskName: taskName,
//           isComplete: false,
//           taskTimestamp: taskTimestamp,
//         );

// }
