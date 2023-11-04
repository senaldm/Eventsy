import 'dart:io';

import 'package:eventsy/Model/Vendor/vendor.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

mixin Deletevendor {
  static Future<void> deletevendor(String vendorKey) async {
    final vendorBox = await Hive.openBox<Vendor>('vendor');

    if (vendorBox.containsKey(vendorKey)) {
      vendorBox.delete(vendorKey);
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/vendors.txt');
    
    if (await file.exists()) {
      final lines = await file.readAsLines();
      final updatedLines = lines.where((line) {
        final vendorData = line.split(',');
        final vendorKeyInFile = vendorData[0];
        return vendorKeyInFile != vendorKey;
      }).toList();

    await file.writeAsString(updatedLines.join('\n'));

    
    }
  }
}
