import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class userDashboard extends StatelessWidget {
  //final String title;

  //userDashboard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,

      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Colors.greenAccent.shade700,
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
                child: Text(' Dashboard',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
              ),
          ),
        ),
        body: Container(
          width: 385,
         // color: const Color(0xFF020A1D), // Set the background color of the body to black
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 35),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/your_tasks');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFD9D9D9)
                          .withOpacity(0.15), // Set button color to black
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14), // Set border radius
                      ), //// Remove padding
                    ),
                    child: Container(
                      width: double
                          .infinity, // Expand button width to fill the container
                      height: 120,
                      child: ListTile(
                        leading: Icon(
                          Icons.check_circle,
                          color: Colors.white, // Set icon color to white
                        ),
                        title: Text(
                          'Tasks',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                        subtitle: Text(
                          'Incomplete',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/invitator_view');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFD9D9D9)
                          .withOpacity(0.15), // Set button color to black
                      padding: EdgeInsets.zero, // Remove padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14), // Set border radius
                      ), // Remove padding
                    ),
                    child: Container(
                      width: double
                          .infinity, // Expand button width to fill the container
                      height: 120,
                      child: ListTile(
                        leading: Icon(
                          Icons.check_circle,
                          color: Colors.white, // Set icon color to white
                        ),
                        title: Text(
                          'Invitations',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Send',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                            Text(
                              'Pending',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/vendor');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFD9D9D9)
                          .withOpacity(0.15), // Set button color to black
                      padding: EdgeInsets.zero, // Remove padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14), // Set border radius
                      ), // Remove padding
                    ),
                    child: Container(
                      width: double
                          .infinity, // Expand button width to fill the container
                      height: 120,
                      child: ListTile(
                        leading: Icon(
                          Icons.check_circle,
                          color: Colors.white, // Set icon color to white
                        ),
                        title: Text(
                          'Vendors',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                        subtitle: Text(
                          'Confirmed',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/settings');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFD9D9D9)
                          .withOpacity(0.15), // Set button color to black
                      padding: EdgeInsets.zero, // Remove padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14), // Set border radius
                      ), // Remove padding
                    ),
                    child: Container(
                      width: double
                          .infinity, // Expand button width to fill the container
                      height: 120,
                      child: ListTile(
                        leading: Icon(
                          Icons.check_circle,
                          color: Colors.white, // Set icon color to white
                        ),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: height * 0.11,
          width:width, // Adjust the height of the bottom navigation bar as needed
          color:  Colors.green.shade900,// Set the background color of the bottom navigation bar

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pDashboard');
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0F4126), // Set button color to black
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14), // Set border radius
                  ), // Remove padding
                ),
                child: Container(
                  width: 300, // Expand button width to fill the container
                  height: 48,
                  child: const ListTile(
                    title: Center(
                      child: Text(
                        'Planner Dashboard',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, // Set font color to white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
