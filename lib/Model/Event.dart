import 'package:hive/hive.dart';

part 'Event.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String categoryName;
  @HiveField(1)
  String taskName;
  @HiveField(2)
  String vendorName;
  @HiveField(3)
  late String budget;
  @HiveField(4)
  bool isComplete;

  void isCompleted() {
    isComplete = false;
  }

  Task(
      {this.categoryName = '',
      this.taskName = '',
      this.vendorName = '',
      this.budget = '',
      this.isComplete = false});
}

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(5)
  String eventName;

  @HiveField(6)
  DateTime? date;

  Event({
    required this.eventName,
    this.date,
  });
}

@HiveType(typeId: 2)
class EventTasks extends Event {
  @HiveField(7)
  late String taskName;

  @HiveField(8)
  String? vendorName;

  @HiveField(9)
  late bool isComplete;

  @HiveField(10)
  late String categoryName;

  @HiveField(11)
  String? budget;

  EventTasks({
    required String eventName,
    required DateTime date,
  }) : super(eventName: eventName, date: date);
}

@HiveType(typeId: 3)
class Invitation extends Event {
  @HiveField(12)
  late String guestName;
  @HiveField(13)
  late bool isSend;

  Invitation({
    required String eventName,
  }) : super(eventName: eventName);
}

@HiveType(typeId: 4)
class UserMode extends HiveObject {
  @HiveField(14)
  String userMode = 'general';
  @HiveField(15)
  bool isFirst = false;
}
