import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

int completedTaskCount = 0;
int incompletedTaskCount = 0;

  @override
  void initState() {
    super.initState();
    // Fetch tasks from the database and calculate counts
    fetchTasksAndUpdateCounts();
  }

   void fetchTasksAndUpdateCounts() {
    // Replace this with your actual database fetch logic
    // For example, you can fetch tasks and update the counts like this:
    // final tasks = await fetchTasksFromDatabase();
    // completedTasksCount = tasks.where((task) => task.isComplete).length;
    // incompletedTasksCount = tasks.where((task) => !task.isComplete).length;

    // For demonstration purposes, I'll set sample counts:
    completedTaskCount = 5; // Replace with actual count
    incompletedTaskCount = 3; // Replace with actual count
  }


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
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
                child: Text(' Dashboard',
                    style: TextStyle(
                      fontSize: width * 0.07,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
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
                       Navigator.pushNamed(context, 'TaskList');
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
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 29, 32),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                children: [
                  Icon(
                    Icons.task_rounded, // Replace with the desired icon
                    color: Colors.lightBlueAccent,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8), // Add some spacing between the icon and text
                  Text(
                    'Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Completed',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$completedTaskCount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Incompleted',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$incompletedTaskCount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  ),
                ),
              Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),

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
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 29, 32),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                children: [
                  Icon(
                    Icons.insert_invitation_sharp, // Replace with the desired icon
                    color: Color.fromARGB(255, 223, 132, 239),
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8), // Add some spacing between the icon and text
                  Text(
                    'Invitations',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
                  Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sent',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$completedTaskCount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreenAccent,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$incompletedTaskCount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  ),
                ),
                Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),

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
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 29, 32),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                children: [
                  Icon(
                    Icons.transfer_within_a_station_rounded, // Replace with the desired icon
                    color: Colors.yellow,
                    size: 24, // Adjust the size as needed
                  ),
                  SizedBox(width: 8), // Add some spacing between the icon and text
                  Text(
                    'Vendors',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirmed',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$completedTaskCount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreenAccent,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$incompletedTaskCount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: height * 0.05,
          width:width, // Adjust the height of the bottom navigation bar as needed
          color: Color.fromARGB(255, 18, 140, 126),// Set the background color of the bottom navigation bar
        ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       ElevatedButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, '/pDashboard');
        //         },
        //         style: ElevatedButton.styleFrom(
        //           primary: const Color(0xFF0F4126), // Set button color to black
        //           padding: EdgeInsets.zero,
        //           shape: RoundedRectangleBorder(
        //             borderRadius:
        //                 BorderRadius.circular(14), // Set border radius
        //           ), // Remove padding
        //         ),
        //         child: Container(
        //           width: 300, // Expand button width to fill the container
        //           height: 48,
        //           child: const ListTile(
        //             title: Center(
        //               child: Text(
        //                 'Planner Dashboard',
        //                 style: TextStyle(
        //                   fontSize: 20,
        //                   color: Colors.white, // Set font color to white
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
