
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      
      children: [
     
        
        Image.asset("assets/Images/Home/image_explore_background2.jpg",
            fit:BoxFit.cover,height: height, width: width,),
           
        WillPopScope(
          child: Scaffold(
            
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                        
                          width: width * 0.2,
                          height: height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.55,
                            ),
                              FloatingActionButton.extended(
                                  heroTag:'btn1',
                          backgroundColor: Colors.white70,
                          onPressed: null,
                          icon: Icon(
                            Icons.search,
                            color: Colors.black87,
                            size: width * 0.07,
                          ),
                          label: Text(
                            'Search Ideas|',
                            style: TextStyle(color: Colors.black87,fontSize: width*0.035,fontFamily: "Quintessential",fontWeight:FontWeight.bold),
                          ),
                        ),
                          ],
                        ),
                        SizedBox(height: height*0.55,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          const Text(
                            'Idea',
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                          
                        ],
                        
                       ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: height * 0.02,
                              
                            ),
                            Align(
                              alignment: Alignment.center,
                                    child:Text(
                                  'If you are lack of ideas to plan event,\n we will help you',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Quintessential",
                                    fontSize: width*0.05,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                  )),
                            )
                            
                        ],
                       ),
                         SizedBox(
                          height: height * 0.01,
                        ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            heroTag: 'btn2',
                                onPressed: () {},
                                backgroundColor: Colors.black87,
                                label: Text(
                                  "Explore",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontFamily: "Roboto"),
                                ))
                        ],
                       ),
                        SizedBox(width: width*0.05,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                         children:[
                          
                              SizedBox(width: width*0.8,),
                               FloatingActionButton(
                              backgroundColor: Colors.black87,
                              onPressed: () {
                                 Navigator.pushNamed(context, '/VendorExplore');
                              },
                              child: Icon(
                                Icons.arrow_right,
                                size: 40.0,
                                color: Colors.white70,
                              ),
                            )
                         ] 
                      )
                      ,
                      
                      ]
                      ),
                ),
              ),
                  
          
                  ),
                  onWillPop: () async {
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Exit'),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            );
            return shouldPop!;
          },
        )
      ],
    );
  }
}

