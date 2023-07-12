// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventbudget.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetEventAdapter extends TypeAdapter<BudgetEvent> {
  @override
  final int typeId = 0;

  @override
  BudgetEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetEvent()..eventName = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, BudgetEvent obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.eventName);
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

class BudgetTaskAdapter extends TypeAdapter<BudgetTask> {
  @override
  final int typeId = 1;

  @override
  BudgetTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetTask()
      ..categoryName = fields[0] as String
      ..eventName = fields[1] as String
      ..vendorName = fields[2] as String
      ..budget = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, BudgetTask obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.vendorName)
      ..writeByte(3)
      ..write(obj.budget);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
