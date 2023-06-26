import 'package:hive/hive.dart';

part 'eventset.g.dart';

@HiveType(typeId: 0)
class Eventset extends HiveObject {
  @HiveField(0)
  late String eventName;
  
}

@HiveType(typeId: 1)
class CategorySet extends HiveObject {
  @HiveField(0)
  late String categoryName;
  @HiveField(1)
  late String eventName;
  @HiveField(2)
  late String taskName;
  @HiveField(3)
  late int totalPrice;
}

@HiveType(typeId: 2)
class SubTaskSet extends HiveObject {
  @HiveField(0)
  late String taskName;
  @HiveField(1)
  late int totalPrice;
  @HiveField(2)
  late String eventName;
}
