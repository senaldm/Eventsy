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
}

@HiveType(typeId: 2)
class SubTaskSet extends HiveObject {
  @HiveField(0)
  late String taskName;
  @HiveField(1)
  late String vendorName;
  @HiveField(2)
  late int totalPrice;
  @HiveField(3)
  late String categoryName;

  get category => null;
}
