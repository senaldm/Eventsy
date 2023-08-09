import 'package:flutter/material.dart';
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
    this.categoryName = '',
    this.taskName = '',
    this.vendorName = '',
    this.budget = '',
    this.isComplete = false,
    this.timestamp,
  });

  // const ConstDateTime(0)}) :this.timestamp = timestamp;
}

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(7)
  String eventName;

  @HiveField(8)
  DateTime? date;

  Event({
    required this.eventName,
    this.date,
  });
}

@HiveType(typeId: 2)
class EventTasks extends Event {
  @HiveField(9)
  late String taskName;

  @HiveField(10)
  String? vendorName;

  @HiveField(11)
  late bool isComplete;

  @HiveField(12)
  late String categoryName;

  @HiveField(13)
  String? budget;

  EventTasks({
    required String eventName,
    required DateTime date,
  }) : super(eventName: eventName, date: date);
}

@HiveType(typeId: 3)
class Invitation extends Event {
  @HiveField(14)
  late String guestName;
  @HiveField(15)
  late bool isSend;

  Invitation({
    required String eventName,
  }) : super(eventName: eventName);
}

@HiveType(typeId: 4)
class UserMode extends HiveObject {
  @HiveField(16)
  String userMode = 'general';
  @HiveField(17)
  bool isFirst = false;
}
//for budget calculator

@HiveType(typeId: 5)
class BudgetEvent extends HiveObject {
  @HiveField(16)
  String eventKey;
  @HiveField(17)
  String eventName;

  @HiveField(18)
  String targetBudget;

  @HiveField(19)
  String taskeventKey;

  @HiveField(20)
  late String categoryName;
  @HiveField(21)
  late String totalPrice;
  @HiveField(22)
  late String vendorName;
  BudgetEvent( {
    this.eventKey = '',
    this.eventName = '',
    this.targetBudget = '',
    this.taskeventKey='',
    this.categoryName = '',
    this.totalPrice = '',
    this.vendorName = '',
  });
}
