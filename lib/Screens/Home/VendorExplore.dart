// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Planners/navigation.dart';

class VendorExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/Images/Home/vendor_explore_background.jpg",
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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
                            color: Colors.black87, fontSize: width * 0.035),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.52,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Vendors',
                      style: TextStyle(
                          fontSize: 60.0,
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
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                        heroTag: 'btn2',
                        onPressed: () {
                          Navigator.pushNamed(context, 'LoginPage');
                          //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Navigation()));
                        },
                        backgroundColor: Colors.black87,
                        label: Text(
                          "Explore",
                          style: TextStyle(
                              fontSize: 30.0,
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
                        heroTag: 'btn3',
                        backgroundColor: Colors.black87,
                        onPressed: () {
                          Navigator.pushNamed(context, '/ImageExplore');
                        },
                        child: Icon(
                          Icons.arrow_left,
                          size: 50.0,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.6,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.black87,
                        onPressed: () {
                          Navigator.pushNamed(context, '/TaskExplore');
                        },
                        child: Icon(
                          Icons.arrow_right,
                          size: 50.0,
                          color: Colors.white70,
                        ),
                      )
                    ]),
              ]),
        )
      ],
    );
  }
}
