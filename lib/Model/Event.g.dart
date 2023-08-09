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
      eventName: fields[7] as String,
      date: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(2)
      ..writeByte(7)
      ..write(obj.eventName)
      ..writeByte(8)
      ..write(obj.date);
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
      eventName: fields[7] as String,
      date: fields[8] as DateTime,
    )
      ..taskName = fields[9] as String
      ..vendorName = fields[10] as String?
      ..isComplete = fields[11] as bool
      ..categoryName = fields[12] as String
      ..budget = fields[13] as String?;
  }

  @override
  void write(BinaryWriter writer, EventTasks obj) {
    writer
      ..writeByte(7)
      ..writeByte(9)
      ..write(obj.taskName)
      ..writeByte(10)
      ..write(obj.vendorName)
      ..writeByte(11)
      ..write(obj.isComplete)
      ..writeByte(12)
      ..write(obj.categoryName)
      ..writeByte(13)
      ..write(obj.budget)
      ..writeByte(7)
      ..write(obj.eventName)
      ..writeByte(8)
      ..write(obj.date);
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

class InvitationAdapter extends TypeAdapter<Invitation> {
  @override
  final int typeId = 3;

  @override
  Invitation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Invitation(
      eventName: fields[7] as String,
    )
      ..guestName = fields[14] as String
      ..isSend = fields[15] as bool
      ..date = fields[8] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Invitation obj) {
    writer
      ..writeByte(4)
      ..writeByte(14)
      ..write(obj.guestName)
      ..writeByte(15)
      ..write(obj.isSend)
      ..writeByte(7)
      ..write(obj.eventName)
      ..writeByte(8)
      ..write(obj.date);
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
  final int typeId = 4;

  @override
  UserMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMode()
      ..userMode = fields[16] as String
      ..isFirst = fields[17] as bool;
  }

  @override
  void write(BinaryWriter writer, UserMode obj) {
    writer
      ..writeByte(2)
      ..writeByte(16)
      ..write(obj.userMode)
      ..writeByte(17)
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

class BudgetEventAdapter extends TypeAdapter<BudgetEvent> {
  @override
  final int typeId = 5;

  @override
  BudgetEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetEvent(
      eventKey: fields[16] as String,
      eventName: fields[17] as String,
      targetBudget: fields[18] as String,
      taskeventKey: fields[19] as String,
      categoryName: fields[20] as String,
      totalPrice: fields[21] as String,
      vendorName: fields[22] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetEvent obj) {
    writer
      ..writeByte(7)
      ..writeByte(16)
      ..write(obj.eventKey)
      ..writeByte(17)
      ..write(obj.eventName)
      ..writeByte(18)
      ..write(obj.targetBudget)
      ..writeByte(19)
      ..write(obj.taskeventKey)
      ..writeByte(20)
      ..write(obj.categoryName)
      ..writeByte(21)
      ..write(obj.totalPrice)
      ..writeByte(22)
      ..write(obj.vendorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
