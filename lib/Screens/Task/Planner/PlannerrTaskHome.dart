// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class PlannerTaskHome extends StatefulWidget {
  const PlannerTaskHome({super.key});

  @override
  State<PlannerTaskHome> createState() => _PlannerTaskHomeState();
}

class _PlannerTaskHomeState extends State<PlannerTaskHome> {
 

    bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        bottom: false,
        left: true,
        right: true,
        child: WillPopScope(
          child: Scaffold(
            // extendBody: true,
            backgroundColor:
                //  Color.fromARGB(255, 38, 50, 56),
                Color.fromARGB(255, 20, 24, 26),
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
                          blurRadius: 1),
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
        
                  title: Text(
                    '',
                    style: TextStyle(
                        fontSize: width * 0.1,
                        fontFamily: 'Quintessential',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 77, 230, 0)),
                    textAlign: TextAlign.center,
                  ),
        
                  actions: <Widget>[
        
                     PopupMenuButton(
                      color:Color.fromARGB(255, 20, 24, 26),
                      icon: Icon(Icons.menu_open,color:Colors.white70),
                      iconSize: 40.0,
            
            itemBuilder: (context){
              return [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Text("Settings",style: TextStyle(color: Colors.white70),),
                    ),
        
                    PopupMenuItem<int>(
                        value: 1,
                        child: Text("Dashboard",style: TextStyle(color: Colors.white70),),
                    ),
        
                
                ];
            },
            onSelected:(value){
              if(value == 0){
                  
              }else if(value == 1){
                 
              }
            }
          ),
                         
        
                    // IconButton(
                    //   onPressed: () {
                    //     // DropdownMenu();
                    //   },
                    //   icon: Icon(Icons.menu_open_sharp),
                    //   splashRadius: 24.0,
                    //   iconSize: width * 0.1,
                    // )
                  ],
                ),
              ),
            ),
        
            body: Column(
              children:[ Expanded(
                flex:1,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                     decoration:  BoxDecoration(
                      image:  DecorationImage(
                        image:  AssetImage("assets/Images/Home/bodyBack4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SingleChildScrollView(
                       physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                      borderOnForeground: false,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/EventList');
                                        },
                                        child: SizedBox(
                                            height: width * 0.25,
                                            width: width * 0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
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
                                                      // Image.asset(
                                                      //     "assets/Images/Home/task.png",
                                                      //     width: width * 0.1),
                                                      SizedBox(width: width * 0.02),
                                                    ]),
                                                SizedBox(
                                                  height: width * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Event',
                                                      style: TextStyle(
                                                          fontSize: height * 0.02,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black87),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                      )),
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
                                            height: width * 0.25,
                                            width: width * 0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color.fromARGB(
                                                            255, 77, 230, 0),
                                                        radius: 24.0,
                                                        child: Image.asset(
                                                            "assets/Images/Home/vendor.png",
                                                            width: width * 0.99),
                                                      ),
                                                      SizedBox(width: width * 0.02),
                                                    ]),
                                                SizedBox(
                                                  height: width * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Vendor',
                                                      style: TextStyle(
                                                          fontSize: height * 0.02,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black87),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: height * 0.03,
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
                                        child: SizedBox(
                                            height: width * 0.25,
                                            width: width * 0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color.fromARGB(
                                                            255, 77, 230, 0),
                                                        radius: 24.0,
                                                        child: Image.asset(
                                                            "assets/Images/Task/invitation.png",
                                                            width: width * 0.09),
                                                      ),
                                                      // Image.asset(
                                                      //     "assets/Images/Home/invitation.png",
                                                      //     width: width * 0.1),
                                                      SizedBox(width: width * 0.02),
                                                    ]),
                                                SizedBox(
                                                  height: width * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Invitation',
                                                      style: TextStyle(
                                                          fontSize: height * 0.02,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black87),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                      )),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                      // margin: EdgeInsets.only(
                                      //     left: width * 0.15, right: width * 0.15),
                                      borderOnForeground: true,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'CategoryShownPage');
                                        },
                                        child: SizedBox(
                                            height: width * 0.25,
                                            width: width * 0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color.fromARGB(
                                                            255, 77, 230, 0),
                                                        radius: 24.0,
                                                        child: Image.asset(
                                                            "assets/Images/Task/budgetCal.png",
                                                            width: width * 0.1),
                                                      ),
                                                      // Image.asset(
                                                      //     "assets/Images/Task/budgetCal.png",
                                                      //     width: width * 0.11),
                                                      // SizedBox(width: width * 0.02),
                                                    ]),
                                                // SizedBox(
                                                //   height: width * 0.02,
                                                // ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Budget',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: height * 0.02,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black87),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height*0.15,
                          ),
                          Text("Eventsy",style: TextStyle(fontSize: 26.0,color:Colors.white70,
                                fontFamily: 'Quintessential'),),
                          Text("Good planning makes best Events",style: TextStyle(fontStyle: FontStyle.italic,color:Colors.white70,fontFamily: 'Quintessential' ),),
                           SizedBox(
                            height: height * 0.1,
                          ),
                        
                         ],
                      ),
                    ),
                  ),
                ),
              ),]
            ),
          ),
            onWillPop: () async {
            // Exit the app.
            Navigator.pushNamed(context, '/TaskExplore');
            return false;
          },
        ));
  }
}
