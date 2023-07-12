import 'package:hive/hive.dart';

part 'eventbudget.g.dart';

@HiveType(typeId: 0)
class BudgetEvent extends HiveObject {
  @HiveField(0)
  late String eventName;
}

@HiveType(typeId: 1)
class BudgetTask extends HiveObject {
  @HiveField(0)
  late String categoryName;
  @HiveField(1)
  late  String eventName;
  @HiveField(2)
  late String vendorName;
  @HiveField(3)
  late String budget;
 
}
