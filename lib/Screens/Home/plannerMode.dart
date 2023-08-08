import 'package:flutter/material.dart';
import 'package:eventsy/Screens/Task/Planner/PlannerrTaskHome.dart';

class PlannerMode extends StatelessWidget {
  const PlannerMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void plannerMode(BuildContext context) {
    Size screenSize = WidgetsBinding.instance.window.physicalSize;
    double width = screenSize.width;
    double height = screenSize.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
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
                        text: const TextSpan(
                            text:
                                "Planner mode is a event planner for whom create this app for plan  professinal multiple events.  Continue as ",
                            style: TextStyle(color: Colors.white70),
                            children: [
                              TextSpan(
                                  text: '\'Planner mode\' ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' or '),
                              TextSpan(
                                  text: ' \'Back\'  ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' to back to General mode')
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
                            Navigator.pop(context);
                            // Navigator.pushNamed(context,'UserHome');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 18, 140, 126),
                          ),
                          child: Text("    Back    ",
                              style: TextStyle(
                                color: Colors.black87,
                              ))),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'PlannerHome');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         PlannerTaskHome(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            // alignment:,
                            backgroundColor: Color.fromARGB(255, 18, 140, 126),
                            // Color.fromARGB(255, 37, 211, 102),
                          ),
                          child: Text("Planner Mode",
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
