import 'package:isar/isar.dart';

part 'Task.g.dart';
@Collection()
class Task {
  
  Id id = Isar.autoIncrement;
  late String taskName;
  late String vendorName;
  late String budget;
  late bool isComplete=false;
}
