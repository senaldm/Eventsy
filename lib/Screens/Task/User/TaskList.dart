// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventsy/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';

import 'package:eventsy/Model/Events/Task.dart';
import 'package:eventsy/boxes.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:eventsy/Screens/Task/User/bottonNavigationPaint.dart';

class TaskList extends StatefulWidget {
  // const TaskList({ Key? key }) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Task> tasks = [];
  @override
  void dispose() {
    Hive.box('taks').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // List<PersistentBottomNavBarItem> navBarsItems() {
    //   return [
    //     PersistentBottomNavBarItem(

    //         // contentPadding: width*0.5,
    //         icon: Icon(
    //           Icons.sort_outlined,
    //         ),
    //         iconSize: width * 0.1,
    //         title: "Sort",
    //         activeColorPrimary: Colors.black87,
    //         inactiveColorPrimary: Colors.black87,
    //         onPressed: () {Navigator.pushNamed(context, '')}),
    //     PersistentBottomNavBarItem(
    //       inactiveIcon: Icon(
    //         Icons.add,
    //         color: Colors.black87,
    //       ),
    //       icon: Icon(
    //         Icons.add,
    //         color: Colors.black87,
    //       ),
    //       iconSize: width * 0.1,
    //       title: "Add",
    //       activeColorSecondary: Colors.black87,
    //       textStyle: TextStyle(color: Colors.black87),
    //       activeColorPrimary: Colors.red.shade900,
    //     ),
    //     PersistentBottomNavBarItem(
    //       icon: Icon(
    //         Icons.filter_alt_outlined,
    //       ),
    //       iconSize: width * 0.1,
    //       title: "Filter",
    //       textStyle: TextStyle(fontSize: 30),
    //       activeColorPrimary: Colors.black87,
    //       inactiveColorPrimary: Colors.black87,
    //     ),
    //   ];
    // }

    // List<Widget> buildScreens() {
    //   return [
    //     Container(),
    //     Container(),
    //     Container(),
    //     // MainScreen(),
    //     //  SettingsScreen()
    //   ];
    // }

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),

            // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

            child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor: Colors.greenAccent.shade700,
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Task List',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          body: ValueListenableBuilder<Box<Task>>(
              valueListenable: Boxes.getTask().listenable(),
              builder: (context, box, _) {
                final tasks = box.values.toList().cast<Task>();

                return buildContent(tasks);
              }),
          bottomNavigationBar: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            alignment : AlignmentDirectional.bottomEnd,

            children: [
                 Container(
                
          height: height*0.11,
          width: width,
          decoration: BoxDecoration(
            border:Border.all(color: Colors.white70)
          ) ,
          // padding:  EdgeInsets.only(top: height*0.1),
          child: CustomPaint(
            painter: ProfileCardPainter(
                color: Colors.green.shade900, avatarRadius: 20,), //3
                child:Container(
                   decoration: ShapeDecoration(
    // color: Colors.white,
    shape:  Border.all(
      color: Colors.white70,
      width: 1.0,
      style: BorderStyle.solid
    ), 
    ),
                )
          ),
        ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: height*0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.add_task_sharp),
                            style: ElevatedButton.styleFrom(
                              // alignment:,
                              backgroundColor: Colors.green.shade900,
                              shape: CircleBorder(),
                              fixedSize: Size(width*0.18, width*0.18),
                              padding: EdgeInsets.all(24),
                              side:BorderSide(color: Colors.white70,width:width*0.008)
                            ),
                          ) 
                             
              
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      FloatingActionButton.extended(
                          onPressed: () {}, label: Text("dfgf")),
                            FloatingActionButton.extended(
                          onPressed: () {}, label: Text("dfgf"))
                  ],)
                ]
              ),
            
            SizedBox(height: height*0.2,),
          
          ])
          // Stack(
          //   children: [
          //     BottomAppBar(
          //       elevation:width*0.2,
          //       //  shape: ,
          //       padding: EdgeInsets.only(bottom:width*0.07),
          //       height: height * 0.1,
          //       color: Colors.greenAccent.shade700,
          //       child: IconTheme(
          //         data: IconThemeData(
          //             color: Theme.of(context).colorScheme.onPrimary),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           children: <Widget>[
          //             IconButton(
          //               tooltip: 'Sort',
          //               icon: Icon(
          //                 Icons.sort_sharp,
          //                 size: width * 0.1,
          //                 color: Colors.blueGrey.shade900,
          //               ),
          //               onPressed: () {},
          //             ),
          //             IconButton(
          //               tooltip: 'Filter',
          //               icon: Icon(
          //                 Icons.filter_alt,
          //                 size: width * 0.1,
          //                 color: Colors.blueGrey.shade900,
          //               ),
          //               onPressed: () {},
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     BottomAppBar(

          //       height: width*0.2,
          //       color:Colors.transparent,
          //       shadowColor:Colors.transparent,
          //         child: Row(

          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         FloatingActionButton(onPressed: () {})
          //       ],
          //     ))
          //   ],
          // ),
          // bottomNavigationBar: BottomAppBar(
          //   height: height * 0.1,
          //   child: PersistentTabView(
          //     context,
          //     screens: buildScreens(),
          //     items: navBarsItems(),
          //     navBarStyle: NavBarStyle.style15,
          //     backgroundColor: Colors.greenAccent.shade700,
          //     confineInSafeArea: true,
          //     // Default is Colors.white.
          //     handleAndroidBackButtonPress: true, // Default is true.
          //     resizeToAvoidBottomInset:
          //         true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          //     stateManagement: true, // Default is true.
          //     hideNavigationBarWhenKeyboardShows:
          //         true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          // decoration: NavBarDecoration(
          //   borderRadius: BorderRadius.circular(10.0),
          //   colorBehindNavBar: Colors.white,
          // ),

          // bottomNavigationBar: Stack(
          //   children: [
          //     BottomAppBar(
          //       height: height*0.1,
          //       color:Colors.greenAccent.shade700,
          //         child:
          //         Padding(padding:EdgeInsets.only(bottom: width*0.08),
          //         child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [

          //         FloatingActionButton.extended(
          //             onPressed: () {}, label: Text("fdfgdg")),
          //         FloatingActionButton.extended(
          //             onPressed: () {}, label: Text("dfggh")),

          //       ],

          //     ),
          //         )
          //     ),

          //     BottomAppBar(
          //        color: Colors.transparent,
          //        height: width*0.3,
          //         child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [FloatingActionButton(onPressed: () {})],
          //     )
          //     )
          //   ],
          // ),
          ),
    );
  }

  Widget buildContent(List<Task> task) {
    if (task.isEmpty) {
      return Center(child: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/addTask');
      }
          //     child:Icon(Icons.add))
          //     Image.asset(
          //   "assets/Images/Home/task.png",
          //   height: height * 0.2,
          // ),

          ));
    } else {
      return Center(
        child: Text('UnderDeveloped'),
      );
    }
  }

  void addTasks(
      String taskName, String vendorName, double budget, bool isComplete) {
    final task = Task()
      ..taskName = taskName
      ..vendorName = vendorName
      ..budget = budget
      ..isComplete = isComplete;

    final box = Boxes.getTask();
    box.add(task);
  }
}
