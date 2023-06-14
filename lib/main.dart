import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:eventsy/Model/Budgetcal/eventset.dart';

// import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:firebase_core/firebase_core.dart';
import 'Screens/LoginandSignupScreens/firebase_options.dart';
import 'routes.dart';
import 'global.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(
    EventsetAdapter(),
  );
  Hive.registerAdapter(CategorySetAdapter());
  Hive.registerAdapter(SubTaskSetAdapter());

  eventsBox = await Hive.openBox<Eventset>('events');
  categoryBox = await Hive.openBox<CategorySet>('category');
  taskBox = await Hive.openBox<SubTaskSet>('task');

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
