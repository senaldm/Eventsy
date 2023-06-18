// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsetAdapter extends TypeAdapter<Eventset> {
  @override
  final int typeId = 0;

  @override
  Eventset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Eventset()..eventName = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Eventset obj) {
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
      other is EventsetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategorySetAdapter extends TypeAdapter<CategorySet> {
  @override
  final int typeId = 1;

  @override
  CategorySet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategorySet()
      ..categoryName = fields[0] as String
      ..eventName = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, CategorySet obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.eventName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorySetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubTaskSetAdapter extends TypeAdapter<SubTaskSet> {
  @override
  final int typeId = 2;

  @override
  SubTaskSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubTaskSet()
      ..taskName = fields[0] as String
      ..vendorName = fields[1] as String
      ..totalPrice = fields[2] as int
      ..categoryName = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, SubTaskSet obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.vendorName)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTaskSetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
