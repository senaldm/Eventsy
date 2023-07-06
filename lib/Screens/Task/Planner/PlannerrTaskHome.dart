// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PlannerTaskHome extends StatelessWidget {
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
            child: Container(
              padding: EdgeInsets.only(top: height * 0.02, right: width * 0.02),
              child: AppBar(
                titleSpacing: 2.2,
                forceMaterialTransparency: false,
                backgroundColor: Colors.blueGrey.shade900,
                automaticallyImplyLeading: false,
                centerTitle: true,

                title: Text(
                  'Eventsy',
                  style: TextStyle(
                      fontSize: width * 0.1,
                      fontFamily: 'Quintessential',
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade900),
                  textAlign: TextAlign.center,
                ),
              
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu_sharp),
                    iconSize: width * 0.1,
                  )
                ],
              ),
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // margin: EdgeInsets.only(
                          //     left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'EventList');
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: width * 0.2,
                                    width: width * 0.2,
                                  ),
                                  Image.asset("assets/Images/Home/task.png",
                                      width: width * 0.1),
                                  // SizedBox(
                                  //   width: width * 0.05,
                                  // ),
                                  Text(
                                    'Event',
                                    style: TextStyle(
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  )
                                ]),
                          )),
                            SizedBox(
                        height: height * 0.03,
                      ),
                            Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // margin: EdgeInsets.only(
                          //     left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(
                                  //   height: height * 0.1,
                                  //   width: width * 0.08,
                                  // ),
                                  Image.asset("assets/Images/Home/vendor.png",
                                      width: width * 0.1),
                                  // SizedBox(
                                  //   width: width * 0.05,
                                  // ),
                                  Text(
                                    'Vendor',
                                    style: TextStyle(
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  )
                                ]),
                          )),
                  
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                           Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // margin: EdgeInsets.only(
                          //     left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(
                                  //   height: height * 0.1,
                                  //   width: width * 0.08,
                                  // ),
                                  Image.asset(
                                      "assets/Images/Home/invitation.png",
                                      width: width * 0.1),
                                  // SizedBox(
                                  //   width: width * 0.05,
                                  // ),
                                  Text(
                                    'Invitation',
                                    style: TextStyle(
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  )
                                ]),
                          )),
                           SizedBox(
                          height: height * 0.03,
                        ),
                           Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // margin: EdgeInsets.only(
                          //     left: width * 0.15, right: width * 0.15),
                          borderOnForeground: false,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'CategoryShownPage');
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(
                                  //   height: height * 0.1,
                                  //   width: width * 0.08,
                                  // ),
                                  Image.asset("assets/Images/Home/task.png",
                                      width: width * 0.1),
                                  // SizedBox(
                                  //   width: width * 0.05,
                                  // ),
                                  Text(
                                    'Budget\nCalculator',
                                    style: TextStyle(
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  )
                                ]),
                          )),
                    ],
                  ),
                  
                     
                ],),

              // Card(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0)),
              //     margin:
              //         EdgeInsets.only(left: width * 0.15, right: width * 0.15),
              //     borderOnForeground: false,
              //     child: TextButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, 'EventList');
              //       },
              //       child: Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             SizedBox(
              //               height: height * 0.1,
              //               width: width * 0.08,
              //             ),
              //             Image.asset("assets/Images/Home/task.png",
              //                 width: width * 0.1),
              //             SizedBox(
              //               width: width * 0.05,
              //             ),
              //             Text(
              //               'Event',
              //               style: TextStyle(
              //                   fontSize: height * 0.04,
              //                   fontWeight: FontWeight.w600,
              //                   color: Colors.black87),
              //             )
              //           ]),
              //     )),
              
              // SizedBox(
              //   height: height * 0.03,

              // ),
          
              
           
            
              // Container(
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight,
              //           colors: <Color>[
              //         Colors.green.shade900,
              //         Colors.black12,
              //         Colors.orange.shade500,
              //       ])),
              // ),
            ],
          ),
        ));
  }
  // return Scaffold(
  //   backgroundColor: Colors.black87,

  //   appBar: AppBar(

  //     backgroundColor: Colors.black87,
  //     flexibleSpace: Text(
  //       'Eventsy',
  //       style:
  //           TextStyle(fontSize: width * 0.1, color: Colors.orange.shade900),
  //       textAlign: TextAlign.center,
  //     ),
  //     actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.menu_sharp),iconSize: width*0.1,)],
  //   ),
  //   body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: const []),
  // );
//     throw UnimplementedError();
//   }
}
