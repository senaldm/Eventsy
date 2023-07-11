// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:eventsy/routes.dart';
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
          
          backgroundColor: const Color.fromARGB(255, 20, 24, 26),
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
                  
                   splashRadius:24.0 ,
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
                            color:  Color.fromARGB(255, 7, 94, 84),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          borderOnForeground: false,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/EventList');
                            },
                            child:SizedBox(
                                    height: width * 0.15,
                                    width: width * 0.4,
                                    child:Row(
                                         mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                              "assets/Images/Home/task.png",
                                              width: width * 0.1),
                                              SizedBox(width:width*0.02),
                                                Text(
                                            'Event',
                                            style: TextStyle(
                                                fontSize: height * 0.025,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87),
                                          )
                                              ],
                                    )
                                  ), 
                          )
                          ),
                            SizedBox(
                        height: height * 0.03,
                      ),
                            Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          borderOnForeground: false,
                          child: TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              height: width * 0.15,
                              width: width * 0.4,
                              child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [                  
                                      Image.asset(
                                          "assets/Images/Home/vendor.png",
                                          width: width * 0.13),
                                      // SizedBox(
                                      //   width: width * 0.01,
                                      // ),
                                      Text(
                                        'Vendor',
                                        style: TextStyle(
                                            fontSize: height * 0.025,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87),
                                      )
                                    ]),
                            )
                           
                          )),
                  
                    ],
                  ),
                  SizedBox(
                    width: width * 0.02,
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
                            child:SizedBox(
                              height: width * 0.15,
                              width: width * 0.4,
                              child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                   
                                      Image.asset(
                                          "assets/Images/Home/invitation.png",
                                          width: width * 0.1),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        'Invitation',
                                        style: TextStyle(
                                            fontSize: height * 0.025,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87),
                                      )
                                    ]),
                            ) 
                           
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
                            child:SizedBox(
                              height: width * 0.15,
                              width: width * 0.4,
                              child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      
                                      Image.asset("assets/Images/Home/task.png",
                                          width: width * 0.1),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        'Budget\nCalculator',
                                        style: TextStyle(
                                            fontSize: height * 0.025,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87),
                                      )
                                    ]),
                            )
                            
                          )),
                    ],
                  ),
                  
                     
                ],),

             
            ],
          ),
        ));
  }
  
}
