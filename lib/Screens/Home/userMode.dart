// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:eventsy/Screens/Home/plannerMode.dart';
import 'package:eventsy/Screens/Task/User/userTaskHome.dart';

class UserModeSelect extends StatelessWidget {
  const UserModeSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void userMode(BuildContext context,String type) {
    Size screenSize = WidgetsBinding.instance.window.physicalSize;
    double width = screenSize.width;
    double height = screenSize.height;

    showDialog(
        context: context,
        builder: ( context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: Text(
              'User mode',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color.fromARGB(255, 20, 29, 32),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                                "General mode is a simple user who use this app for plan their own event.  Continue as ",
                            style: TextStyle(color: Colors.white70),
                            children: const [
                              TextSpan(
                                  text: '\'General mode\' ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' or '),
                              TextSpan(
                                  text: ' \'Next\'  ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'to see other user mode')
                            ]),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserTaskHome(),
                              ),
                            );
                            if(type=='vendor')
                            {
                              Navigator.pushNamed(context, '/PlannersPage');
                            }
                            else if(type=='planning')
                            {
                              Navigator.pushNamed(context, 'UserHome');
                            }
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 18, 140, 126),
                          ),
                          child: Text("General mode",
                              style: TextStyle(
                                color: Colors.black87,
                              ))),
                      ElevatedButton(
                          onPressed: () {
                            PlannerMode.plannerMode(context,type);
                          },
                          style: ElevatedButton.styleFrom(
                            // alignment:,
                            backgroundColor:  Color.fromARGB(255, 18, 140, 126),
                            // Color.fromARGB(255, 37, 211, 102),
                          ),
                          child: Text("      Next      ",
                              style: TextStyle(
                                color: Colors.black87,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
