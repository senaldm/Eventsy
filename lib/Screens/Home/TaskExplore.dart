// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eventsy/Screens/Home/userMode.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:eventsy/Model/Event.dart';

class TaskExplore extends StatelessWidget {
  Box<UserMode>? userModeBox;
  // bool isFirst=userModeBox?.isFirst;
  @override
  void initState() {
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    userModeBox = await Hive.openBox<UserMode>('userMode');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(
          "assets/Images/Home/todo_explore_background3.jpg",
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        WillPopScope(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.2,
                        height: height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.7,
                          ),
                          FloatingActionButton.extended(
                            heroTag: 'btn1',
                            backgroundColor: Colors.white,
                            onPressed: null,
                            icon: Icon(
                              Icons.check_box,
                              color: Colors.black87,
                              size: width * 0.07,
                            ),
                            label: Text(
                              'ToDo',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: width * 0.035,fontFamily: "Quintessential",fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Planing',
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                'No such thing to plan Event??\n Eventsy is best option',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Quintessential",
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                              onPressed: () {
                                // if(userModeBox.isFirst)
                                UserModeSelect.userMode(context,'vendor');
                              },
                              backgroundColor: Colors.black87,
                              label: Text(
                                "Explore",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontFamily: "Roboto"),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'btn2',
                              backgroundColor: Colors.black87,
                              onPressed: () {
                                Navigator.pushNamed(context, '/VendorExplore');
                              },
                              child: Icon(
                                Icons.arrow_left,
                                size: 40.0,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.65,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn3',
                              backgroundColor: Colors.black87,
                              onPressed: () {
                                Navigator.pushNamed(context, '/ImageExplore');
                              },
                              child: Icon(
                                Icons.arrow_right,
                                size: 40.0,
                                color: Colors.white70,
                              ),
                            )
                          ]),
                    ]),
              ),
            ),
          ),
          onWillPop: () async {
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Exit'),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            );
            return shouldPop!;
          },
        )
      ],
    );
  }
}

getUser() {
  SharedPreferences prefs =
      SharedPreferences.getInstance() as SharedPreferences;
  String userType = prefs.getString("userType") ?? "User";
  return userType;
}
