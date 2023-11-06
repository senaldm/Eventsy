// vendor.dart

import 'package:hive/hive.dart';

part 'vendor.g.dart';

@HiveType(typeId: 8)
class Vendor {
  @HiveField(0)
   String vendorName;

  @HiveField(1)
   String date;

  @HiveField(2)
   String note;

  @HiveField(3)
   bool isComplete;

  @HiveField(4)
    DateTime? timestamp;

  Vendor({
    this.vendorName = '',
    this.date = '',
    this.note = '',
    this.isComplete = false,
    this.timestamp,
  });

  // Function to check if data is saved
  static Future<bool> isDataSaved() async {
    final box = await Hive.openBox<Vendor>('vendor'); // Replace 'vendor' with your box name
    return box.isNotEmpty;
  }
}

