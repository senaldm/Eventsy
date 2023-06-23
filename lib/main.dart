import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';

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
  // Hive.registerAdapter(
  //   EventsetAdapter(),
  // );
  // Hive.registerAdapter(CategorySetAdapter());
  // Hive.registerAdapter(SubTaskSetAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(EventTasksAdapter());
  Hive.registerAdapter(InvitationAdapter());

  eventBox = await Hive.openBox<Event>('event');
  taskBox = await Hive.openBox<Task>('task');
  eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
  invitationBox = await Hive.openBox<Invitation>('invitation');
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
