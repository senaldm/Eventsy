// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketHandlingHome extends StatefulWidget {
  const TicketHandlingHome({super.key});

  @override
  State<TicketHandlingHome> createState() => _TicketHandlingHomeState();
}

class _TicketHandlingHomeState extends State<TicketHandlingHome> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        bottom: true,
        left: true,
        right: true,
        child: WillPopScope(
          child: Scaffold(
            backgroundColor: Colors.blueGrey.shade900,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.3),
              child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //     bottomRight: Radius.circular(8.0),
                    //     bottomLeft: Radius.circular(8.0)),
                    color: Colors.transparent,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black87,
                          // offset: Offset(0, 1),
                          blurRadius: 10),
                    ]),
                //  padding: EdgeInsets.only(top: height * 0.02, right: width * 0.02),
                child: AppBar(
                  //  titleSpacing: 2.2,

                  forceMaterialTransparency: false,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  centerTitle: true,

                  flexibleSpace: Image.asset(
                    "assets/Images/Task/appbarBackground5.jpeg",
                  ),
                  actions: <Widget>[
                    PopupMenuButton(
                        color: Color.fromARGB(255, 20, 24, 26),
                        icon: Icon(Icons.menu_open, color: Colors.white70),
                        iconSize: 40.0,
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Text(
                                "Settings",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Text(
                                "Dashboard",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == 0) {
                            Navigator.pushNamed(context, '/userSettings');
                          } else if (value == 1) {
                            Navigator.pushNamed(context, '/userDashboard');
                          }
                        }),
                  ],
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.1,
                            ),
                            Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                // margin:EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                                borderOnForeground: false,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'TaskList');
                                  },
                                  child: SizedBox(
                                    width: width * 0.4,
                                    height: height * 0.07,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Color.fromARGB(
                                                255, 20, 158, 85),
                                            radius: 24.0,
                                            child: Image.asset(
                                                "assets/Images/Home/task.png",
                                                width: width * 0.09),
                                          ),
                                          // SizedBox(
                                          //   height: height * 0.1,
                                          //   width: width * 0.04,
                                          // ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Create Tickets',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87),
                                            ),
                                          )
                                        ]),
                                  ), 
                                )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.only(
                                    left: width * 0.15, right: width * 0.15),
                                borderOnForeground: false,
                                child: TextButton(
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                            'https://eventsy-gray.vercel.app/#signup'));
                                  },
                                  child: SizedBox(
                                    width: width * 0.4,
                                    height: height * 0.07,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Color.fromARGB(255, 77, 230, 0),
                                            radius: 24.0,
                                            child: Image.asset(
                                                "assets/Images/Home/vendor.png",
                                                width: width * 0.99),
                                          ),
                                          // SizedBox(
                                          //   width: width * 0.04,
                                          // ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Create QR Code',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87),
                                            ),
                                          )
                                        ]),
                                  ),
                                )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                margin: EdgeInsets.only(
                                    left: width * 0.15, right: width * 0.15),
                                borderOnForeground: false,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/UserCode');
                                  },
                                  child: SizedBox(
                                    width: width * 0.4,
                                    height: height * 0.07,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Color.fromARGB(255, 77, 230, 0),
                                            radius: 24.0,
                                            child: Image.asset(
                                                "assets/Images/Task/invitation.png",
                                                width: width * 0.09),
                                          ),
                                          // SizedBox(
                                          //   // height: height * 0.1,
                                          //   width: width * 0.05,
                                          // ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Validate Tickets',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87),
                                            ),
                                          )
                                        ]),
                                  ),
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.15,
                                ),
                                Text(
                                  "Eventsy",
                                  style: TextStyle(
                                      fontSize: 26.0,
                                      color: Colors.white70,
                                      fontFamily: 'Quintessential'),
                                ),
                                Text(
                                  "Good planning makes better Events...",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white70,
                                      fontFamily: 'Quintessential'),
                                ),
                                SizedBox(
                                  height: height * 0.1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onWillPop: () async {
            // Exit the app.
            Navigator.pushNamed(context, '/TicketHandling');
            return false;
          },
        ));
  }
}
