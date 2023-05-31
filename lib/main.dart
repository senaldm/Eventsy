import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'Screens/Home/ImageExplore.dart';
import 'Screens/Home/home.dart';
import 'Screens/Home/VendorExplore.dart';
import 'Screens/Home/TaskExplore.dart';
import 'Screens/Task/User/userTaskHome.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => FirstPage(),
      ),
    );

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eventsy',
        routes: <String, WidgetBuilder>{
          '/home': (context) => home(),
          '/ImageExplore': (context) => ImageExplore(),
          '/VendorExplore': (context) => VendorExplore(),
          '/TaskExplore': (context) => TaskExplore(),
          '/UserHome': (context) => UserTaskHome(),
        },
        home: home());
  }
}
