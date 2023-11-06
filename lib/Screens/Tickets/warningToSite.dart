// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class warningToSite extends StatelessWidget {
  const warningToSite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void userMode(BuildContext context) {
    Size screenSize = WidgetsBinding.instance.window.physicalSize;
    double width = screenSize.width;
    double height = screenSize.height;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: Text(
              'Alert !',
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
                              "This is supportive site of Eventsy Mobile App developed for creating Tickets and QR codes easily with larger view.It is better to use this site in larger size of device ",
                          style: TextStyle(color: Colors.white70),
                        ),
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
                             launchUrl(Uri.parse(
                                'https://eventsy-gray.vercel.app/'));
                          },
                          style: ElevatedButton.styleFrom(
                            // alignment:,
                            backgroundColor: Color.fromARGB(255, 18, 140, 126),
                            // Color.fromARGB(255, 37, 211, 102),
                          ),
                          child: Text("  Continue  ",
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
