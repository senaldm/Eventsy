import 'package:hive/hive.dart';
import 'package:eventsy/Model/Events/Task.dart';

class Boxes {
  static Box<Task> getTask() => Hive.box<Task>('task');
}
