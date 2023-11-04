import 'package:hive/hive.dart';

part 'invitatory.g.dart';

@HiveType(typeId: 7)
class Invitatory {
  @HiveField(0)
  String guestName;

  @HiveField(1)
  String date;

  @HiveField(2)
  String note;

  @HiveField(3)
  bool isInvitatorySent; // Rename to isInvitatorySent

  Invitatory({
    this.guestName = '', // Update field name
    this.date = '',
    this.note = '',
    this.isInvitatorySent = false, // Update field name
  });

  // Function to check if data is saved
  static Future<bool> isDataSaved() async {
    final box = await Hive.openBox<Invitatory>('invitatory'); // Use 'invitatory' as your box name
    return box.isNotEmpty;
  }
}
