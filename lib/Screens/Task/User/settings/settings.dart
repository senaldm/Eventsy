import 'dart:math';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class userSettings extends StatelessWidget {
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
              backgroundColor:Color.fromARGB(255, 18, 140, 126),
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Settings',
                    style: TextStyle(
                        fontSize: width * 0.06,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical:width*0.1),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>
                [
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  Container(
                    width: double
                            .infinity,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'ProfileSettingsPage');
                      },
                      style: ElevatedButton.styleFrom(
                        
                        primary: Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), //// Remove padding
                      ),
                      
                      child: Container(
                        
                        width: double
                            .infinity,// Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.account_circle_rounded,color: Colors.white,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Profile Setting',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                       Navigator.pushNamed(context, 'PasswordChangePage');
                      },
                      style: ElevatedButton.styleFrom(
                        primary:  Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), // // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.lock_person_rounded,color: Colors.blueGrey,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Privacy & Security',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'NotificationSettingsPage');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.notifications_active_rounded,color: Colors.lightBlueAccent,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Notification',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'FeedbackAndContactPage');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading: Icon(Icons.help_center_rounded,color: Colors.lightGreenAccent,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Help & Support',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushNamed(context, 'SimpleRatingBar');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading:
                              Icon(Icons.star_half_rounded,color: Colors.amber,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Rate Us',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'LogoutPage');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading:
                             Icon(Icons.logout_rounded,color: Colors.red,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                   Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'LogoutPage');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueGrey.shade900.withOpacity(0.1), // Set button color to black
                        padding: EdgeInsets.zero, // Remove padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Set border radius
                        ), // Remove padding
                      ),
                      child: Container(
                        width: double
                            .infinity, // Expand button width to fill the container
                        height: 50,
                        child: ListTile(
                          leading:
                             Icon(Icons.cached_rounded,color: Colors.lime,size: 30,),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Switch User Mode',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                ],
              ),
            ),
          ),
          
          bottomNavigationBar: BottomAppBar(
              color: Color.fromARGB(255, 18, 140, 126),
              height: 80,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushNamed(context, 'UserHome');
                      },
                      backgroundColor: Colors.blueGrey.shade900,
                      label: Text(
                        ' Back ',
                        style: TextStyle(
                            fontSize: 15.0,
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
                        ' Add ',
                        style: TextStyle(
                            fontSize: 15.0,
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
