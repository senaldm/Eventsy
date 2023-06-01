import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'routes.dart';

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
       
        home:Routes());
  }
}
