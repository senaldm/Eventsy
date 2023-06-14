import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


// import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';


import 'package:firebase_core/firebase_core.dart';
import 'Screens/LoginandSignupScreens/firebase_options.dart';
import 'routes.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

 
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
