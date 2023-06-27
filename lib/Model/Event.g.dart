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
      categoryName: fields[0] as String,
      taskName: fields[1] as String,
      vendorName: fields[2] as String,
      budget: fields[3] as String,
      isComplete: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.taskName)
      ..writeByte(2)
      ..write(obj.vendorName)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.isComplete);
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
      eventName: fields[5] as String,
      date: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(2)
      ..writeByte(5)
      ..write(obj.eventName)
      ..writeByte(6)
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
      eventName: fields[5] as String,
      date: fields[6] as DateTime,
    )
      ..taskName = fields[7] as String
      ..vendorName = fields[8] as String?
      ..isComplete = fields[9] as bool
      ..categoryName = fields[10] as String
      ..budget = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, EventTasks obj) {
    writer
      ..writeByte(7)
      ..writeByte(7)
      ..write(obj.taskName)
      ..writeByte(8)
      ..write(obj.vendorName)
      ..writeByte(9)
      ..write(obj.isComplete)
      ..writeByte(10)
      ..write(obj.categoryName)
      ..writeByte(11)
      ..write(obj.budget)
      ..writeByte(5)
      ..write(obj.eventName)
      ..writeByte(6)
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
      eventName: fields[5] as String,
    )
      ..guestName = fields[12] as String
      ..date = fields[6] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Invitation obj) {
    writer
      ..writeByte(3)
      ..writeByte(12)
      ..write(obj.guestName)
      ..writeByte(5)
      ..write(obj.eventName)
      ..writeByte(6)
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
