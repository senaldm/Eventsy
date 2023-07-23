import 'dart:math';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';



class settings extends StatelessWidget {
  // final String title;

  // Settings({Key? key, required this.title}) : super(key: key);

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
                child: Text('Settings',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
              ),
            ),
          ),
          body: Container(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 35),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           recievedProjects(title: ' recievedProjects')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900, // Set button color to black
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14), // Set border radius
                        ), //// Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading:
                              Image.asset('assets/Images/settings//profile.png'),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Profile Setting',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white, // Set font color to white
                              ),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           UserDashboard(title: 'Dashboard')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900, // Set button color to black
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14), // Set border radius
                        ), // // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Image.asset(
                              'assets/Images/settings//privacy_security.png'),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Privacy & Security',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white, // Set font color to white
                              ),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           UserDashboard(title: 'Dashboard')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900, // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Image.asset(
                              'assets/Images/settings/notifications.png'),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Notification',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white, // Set font color to white
                              ),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           UserDashboard(title: 'Dashboard')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900, // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Image.asset(
                              'assets/Images/settings/help_support.png'),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Help & Support',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white, // Set font color to white
                              ),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           UserDashboard(title: 'Dashboard')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900, // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading:
                              Image.asset('assets/Images/settings/rate us.png'),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Rate Us',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white, // Set font color to white
                              ),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           UserDashboard(title: 'Dashboard')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900, // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading:
                              Image.asset('assets/Images/settings/logout.png'),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white, // Set font color to white
                              ),
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
          bottomNavigationBar: BottomAppBar(
              color: Colors.greenAccent.shade700,
              height: 90,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/TaskList');
                      },
                      backgroundColor: Colors.blueGrey.shade900,
                      label: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/TaskList');
                      },
                      backgroundColor: Colors.blueGrey.shade900,
                      label: Text(
                        ' Back ',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
