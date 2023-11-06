import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';

part 'plannerVendor.g.dart';


@HiveType(typeId: 9)
class VendorTask extends EventTasks {
  
  @HiveField(16)
  String vendorName;
  @HiveField(17)
  DateTime? date;
  @HiveField(18)
  String note;

  VendorTask({
    required eventKey,
    required eventName,
    required taskKey,
    required taskName,
    required this.vendorName,
    this.date,
    this.note = '',
    required taskTimestamp,
  }) : super(
          eventKey: eventKey,
          eventName: eventName,
          taskKey: taskKey,
          taskName: taskName,
          isComplete: false,
          taskTimestamp: taskTimestamp,
        );

}
