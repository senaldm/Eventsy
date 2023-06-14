import 'package:hive/hive.dart';

part 'Task.g.dart';
// @Collection()
// class Task {
  
//   Id id = Isar.autoIncrement;
//   late String taskName;
//   late String vendorName;
//   late String budget;
//   late bool isComplete=false;
// }
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late int id;
  
  @HiveField(1)
  late String taskName;

   @HiveField(2)
   late String vendorName;

   @HiveField(3)
   late double budget;

   @HiveField(4)
   late bool isComplete=false;

  static add(Task task) {}

   
  

}
