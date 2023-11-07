// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:eventsy/Screens/Home/userMode.dart';
import 'package:flutter/services.dart';


class VendorExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/Images/Home/vendor_explore_background2.jpg",
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
                            backgroundColor: Colors.orange.shade700,
                            onPressed: null,
                            icon: Icon(
                              Icons.search,
                              color: Colors.black87,
                              size: width * 0.07,
                            ),
                            label: Text(
                              'Find',
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
                            'Vendors',
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
                                'Are you looking for professionals,\nHere we are',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Quintessential",
                                  wordSpacing: null,
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
                              heroTag: 'btn3',
                              onPressed: () {
                                UserModeSelect.userMode(context,'vendor');
                               // Navigator.pushNamed(context, 'LoginPage');
                                //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Navigation()));
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
                              heroTag: 'btn4',
                              backgroundColor: Colors.black87,
                              onPressed: () {
                                Navigator.pushNamed(context, '/ImageExplore');
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
                              backgroundColor: Colors.black87,
                              onPressed: () {
                                Navigator.pushNamed(context, '/TaskExplore');
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
