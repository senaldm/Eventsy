// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VendorAdapter extends TypeAdapter<Vendor> {
  @override
  final int typeId = 8;

  @override
  Vendor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vendor(
      vendorName: fields[0] as String,
      date: fields[1] as String,
      note: fields[2] as String,
      isComplete: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Vendor obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.vendorName)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VendorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
