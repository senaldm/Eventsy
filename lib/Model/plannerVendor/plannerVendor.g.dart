// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plannerVendor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VendorTaskAdapter extends TypeAdapter<VendorTask> {
  @override
  final int typeId = 9;

  @override
  VendorTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VendorTask(
      eventKey: fields[0] as dynamic,
      eventName: fields[1] as dynamic,
      taskKey: fields[7] as dynamic,
      taskName: fields[8] as dynamic,
      vendorName: fields[16] as String,
      date: fields[17] as DateTime?,
      note: fields[18] as String,
      taskTimestamp: fields[13] as dynamic,
    )
      ..isComplete = fields[10] as bool
      ..categoryName = fields[11] as String
      ..budget = fields[12] as String
      ..eventDate = fields[2] as DateTime?
      ..venue = fields[4] as String
      ..timestamp = fields[5] as DateTime?
      ..isEventComplete = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, VendorTask obj) {
    writer
      ..writeByte(15)
      ..writeByte(16)
      ..write(obj.vendorName)
      ..writeByte(17)
      ..write(obj.date)
      ..writeByte(18)
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.taskKey)
      ..writeByte(8)
      ..write(obj.taskName)
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
      other is VendorTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
