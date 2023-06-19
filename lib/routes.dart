import 'package:eventsy/Screens/Task/User/TaskList.dart';
import 'package:flutter/material.dart';
import 'Screens/Home/ImageExplore.dart';
import 'Screens/Home/home.dart';
import 'Screens/Home/VendorExplore.dart';
import 'Screens/Home/TaskExplore.dart';
import 'Screens/Task/User/userTaskHome.dart';
import 'Screens/LoginandSignUpScreens/logoutscreen.dart';
import 'Screens/LoginandSignupScreens/signupoptionpage.dart';
import 'Screens/LoginandSignupScreens/signup.dart';
import 'Screens/LoginandSignUpScreens/loginpage.dart';
import 'Screens/Task/User/AddTask.dart';
import 'Screens/Task/Planner/PlannerrTaskHome.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //////// MAIN ////////////
        '/home': (context) => home(),
        '/ImageExplore': (context) => ImageExplore(),
        '/VendorExplore': (context) => VendorExplore(),
        '/TaskExplore': (context) => TaskExplore(),
        
        ////////USER TASK////////
        '/UserHome': (context) => UserTaskHome(),
        '/TaskList': (context) => TaskList(),
        '/addTask':(context)=> AddTask(),

        /////////PLANNER TASK/////////
        'PlannerHome':(context)=>PlannerTaskHome(),

        /////////////// LOGIN ////////////////////////////
        '/LoginPage': (context) => Loginpage(),
        './SignUpPage': (context) => SignUpPage(),
        './SignUpOptionPage': (context) => SignUpOptionPage(),
        './LogOutScreen': (context) => LogOutScreen(),
      },
      home: home(),
    );
  }
}
