
//import 'package:eventsy/Planners/navigation.dart';
import 'package:eventsy/User/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(builder: (BuildContext context) {
    return const MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eventsy",
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // in this method replace the Navigation() into your class Name And import that file here
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Navigation()));
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Navigation()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 140, 126),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pix, color: Colors.white, size: 100),
            SizedBox(
              height: 40.0,
              child: Text(
                "Planners",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // CircularProgressIndicator(
            //   color: Colors.white,
            // )
            CupertinoActivityIndicator(
              radius: 20.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
