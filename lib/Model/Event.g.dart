// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      taskKey: fields[0] as String,
      categoryName: fields[1] as String,
      taskName: fields[2] as String,
      vendorName: fields[3] as String,
      budget: fields[4] as String,
      isComplete: fields[5] as bool,
      timestamp: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskKey)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.taskName)
      ..writeByte(3)
      ..write(obj.vendorName)
      ..writeByte(4)
      ..write(obj.budget)
      ..writeByte(5)
      ..write(obj.isComplete)
      ..writeByte(6)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 1;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      eventKey: fields[0] as String,
      eventName: fields[1] as String,
      eventDate: fields[2] as DateTime?,
      note: fields[3] as String,
      venue: fields[4] as String,
      timestamp: fields[5] as DateTime?,
      isEventComplete: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.eventKey)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.eventDate)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.venue)
      ..writeByte(5)
      ..write(obj.timestamp)
      ..writeByte(6)
      ..write(obj.isEventComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventTasksAdapter extends TypeAdapter<EventTasks> {
  @override
  final int typeId = 2;

  @override
  EventTasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventTasks(
      eventKey: fields[0] as dynamic,
      eventName: fields[1] as dynamic,
      taskKey: fields[7] as String,
      taskName: fields[8] as String,
      vendorName: fields[9] as String,
      isComplete: fields[10] as bool,
      categoryName: fields[11] as String,
      budget: fields[12] as String,
      taskTimestamp: fields[13] as DateTime,
    )
      ..eventDate = fields[2] as DateTime?
      ..note = fields[3] as String
      ..venue = fields[4] as String
      ..timestamp = fields[5] as DateTime?
      ..isEventComplete = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, EventTasks obj) {
    writer
      ..writeByte(14)
      ..writeByte(7)
      ..write(obj.taskKey)
      ..writeByte(8)
      ..write(obj.taskName)
      ..writeByte(9)
      ..write(obj.vendorName)
      ..writeByte(10)
      ..write(obj.isComplete)
      ..writeByte(11)
      ..write(obj.categoryName)
      ..writeByte(12)
      ..write(obj.budget)
      ..writeByte(13)
      ..write(obj.taskTimestamp)
      ..writeByte(0)
      ..write(obj.eventKey)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.eventDate)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.venue)
      ..writeByte(5)
      ..write(obj.timestamp)
      ..writeByte(6)
      ..write(obj.isEventComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventTasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BudgetTasksAdapter extends TypeAdapter<BudgetTasks> {
  @override
  final int typeId = 3;

  @override
  BudgetTasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetTasks(
      taskKey: fields[7] as dynamic,
      taskName: fields[8] as dynamic,
      vendorName: fields[9] as dynamic,
      budget: fields[12] as dynamic,
      categoryName: fields[11] as dynamic,
      actualBudget: fields[15] as String,
      budgetKey: fields[14] as String,
    )
      ..isComplete = fields[10] as bool
      ..taskTimestamp = fields[13] as DateTime
      ..eventKey = fields[0] as String
      ..eventName = fields[1] as String
      ..eventDate = fields[2] as DateTime?
      ..note = fields[3] as String
      ..venue = fields[4] as String
      ..timestamp = fields[5] as DateTime?
      ..isEventComplete = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, BudgetTasks obj) {
    writer
      ..writeByte(16)
      ..writeByte(14)
      ..write(obj.budgetKey)
      ..writeByte(15)
      ..write(obj.actualBudget)
      ..writeByte(7)
      ..write(obj.taskKey)
      ..writeByte(8)
      ..write(obj.taskName)
      ..writeByte(9)
      ..write(obj.vendorName)
      ..writeByte(10)
      ..write(obj.isComplete)
      ..writeByte(11)
      ..write(obj.categoryName)
      ..writeByte(12)
      ..write(obj.budget)
      ..writeByte(13)
      ..write(obj.taskTimestamp)
      ..writeByte(0)
      ..write(obj.eventKey)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.eventDate)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.venue)
      ..writeByte(5)
      ..write(obj.timestamp)
      ..writeByte(6)
      ..write(obj.isEventComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetTasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InvitationAdapter extends TypeAdapter<Invitation> {
  @override
  final int typeId = 4;

  @override
  Invitation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Invitation(
      eventKey: fields[0] as String,
      eventName: fields[1] as String,
    )
      ..guestName = fields[7] as String
      ..isSend = fields[8] as bool
      ..eventDate = fields[2] as DateTime?
      ..note = fields[3] as String
      ..venue = fields[4] as String
      ..timestamp = fields[5] as DateTime?
      ..isEventComplete = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, Invitation obj) {
    writer
      ..writeByte(9)
      ..writeByte(7)
      ..write(obj.guestName)
      ..writeByte(8)
      ..write(obj.isSend)
      ..writeByte(0)
      ..write(obj.eventKey)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.eventDate)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.venue)
      ..writeByte(5)
      ..write(obj.timestamp)
      ..writeByte(6)
      ..write(obj.isEventComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvitationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserModeAdapter extends TypeAdapter<UserMode> {
  @override
  final int typeId = 5;

  @override
  UserMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMode(
      userMode: fields[0] as String,
      isFirst: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserMode obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userMode)
      ..writeByte(1)
      ..write(obj.isFirst);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
