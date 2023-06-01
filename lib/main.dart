import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


import 'package:firebase_core/firebase_core.dart';
import 'Screens/LoginandSignUpScreens/firebase_options.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      builder: (context) => FirstPage(),
    ),
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eventsy',
        home:Routes(),);

  }}