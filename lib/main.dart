import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';
import 'Screens/LoginandSignupScreens/firebase_options.dart';
import 'routes.dart';
import 'global.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive and get the application documents directory
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
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
  Hive.registerAdapter(UserModeAdapter());

  eventBox = await Hive.openBox<Event>('event');
  taskBox = await Hive.openBox<Task>('task');
  eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
  invitationBox = await Hive.openBox<Invitation>('invitation');
  userModeBox = await Hive.openBox<UserMode>('userMode');
// void main()=>runApp(
//     DevicePreview(

//       builder:(context)=> FirstPage(),
//     ),
//   );
// }

// void main() {
  // runApp(FirstPage());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(FirstPage());
  });
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Eventsy',
        home: Routes());
  }
}
