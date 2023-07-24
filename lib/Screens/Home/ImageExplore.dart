
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ImageExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      
      children: [
     
        
        Image.asset("assets/Images/Home/image_explore_background2.jpg",
            fit:BoxFit.cover,height: height, width: width,),
           
        Scaffold(
          
            backgroundColor: Colors.transparent,
            body: Column(
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
                      style: TextStyle(color: Colors.black87,fontSize: width*0.035),
                    ),
                  ),
                    ],
                  ),
                  SizedBox(height: height*0.52,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    const Text(
                      'Idea',
                      style: TextStyle(
                          fontSize: 60.0,
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
                            'If you are lack of ideas to plan \nevent,here we will help you',
                            style: TextStyle(
                              fontSize: width*0.05,
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                            )),
                      )
                      
                  ],
                 ),
                   SizedBox(
                    height: height * 0.02,
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
                                fontSize: 30.0,
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
                    
                        SizedBox(width: width*0.7,),
                         FloatingActionButton(
                        backgroundColor: Colors.black87,
                        onPressed: () {
                           Navigator.pushNamed(context, '/VendorExplore');
                        },
                        child: Icon(
                          Icons.arrow_right,
                          size: 50.0,
                          color: Colors.white70,
                        ),
                      )
                   ] 
                )
                ,
                
                ]
                ),
                

                )
      ],
    );
  }
}

