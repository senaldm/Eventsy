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
  bool isInvitatorySent; 

  Invitatory({
    this.guestName = '', 
    this.date = '',
    this.note = '',
    this.isInvitatorySent = false, 
  });

  // Function to check if data is saved
  static Future<bool> isDataSaved() async {
    final box = await Hive.openBox<Invitatory>('invitatory'); 
    return box.isNotEmpty;
  }
}
