// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:eventsy/Screens/Home/ImageExplore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:package_info/package_info.dart';





class HomeSplashScreen extends StatefulWidget {
  const HomeSplashScreen({super.key});

  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {
   String version = 'Unknown';
  // in this method replace the Navigation() into your class Name And import that file here
  @override
  void initState() {
    super.initState();
    _getVersion();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  ImageExplore()));
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Navigation()));
    });
  }

  @override
  Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 2, 36),
        body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Images/auth/logonew.png',
                    width: 100,
                    height: 100,
                  ),
                  // Icon(Icons.pix, color: Colors.white, size: 100),
                  SizedBox(
                    height: 40.0,
                    child: Text(
                      "Eventsy",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              
                  CupertinoActivityIndicator(
                    radius: 20.0,
                    color: Colors.white,
                  ),
                   Positioned(
                            bottom: height * 0.05,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Text(
                                  "Version: $version",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white70,
                                      fontFamily: 'Quintessential'),
                                ),
                                
                              ],
                            ),
                          ),
                ],
              ),
            ],
          ),
          
        ),
        
      ),
      onWillPop: () async {
        
        Navigator.pushNamed(context, '/ImageExplore');
        return false;
      },
    );
  }

  Future<void> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }
}
