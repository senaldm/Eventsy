import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eventsy/Model/Events/Task.dart';
import 'package:eventsy/boxes.dart';

import 'routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('task');
  runApp(
    DevicePreview(
      builder: (context) => FirstPage(),
    ),
  );
}

// void main() {
//   runApp( FirstPage());
// }
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Eventsy', home: Routes());
  }
}
