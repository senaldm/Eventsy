// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserTaskHome extends StatelessWidget {
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
                // flexibleSpace: Container(
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors:<Color>[

                //         Colors.green.shade900,
                //         Colors.black12,
                //         Colors.blue.shade900,
                //       ]
                //     )
                //   ),
                // ),
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
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin:
                      EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                  borderOnForeground: false,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, './CategoryDetailsShownPage');
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                            width: width * 0.08,
                          ),
                          Image.asset("assets/Images/Home/task.png",
                              width: width * 0.1),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Task',
                            style: TextStyle(
                                fontSize: height * 0.04,
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
                  margin:
                      EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                  borderOnForeground: false,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                            width: width * 0.08,
                          ),
                          Image.asset("assets/Images/Home/vendor.png",
                              width: width * 0.1),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Vendor',
                            style: TextStyle(
                                fontSize: height * 0.04,
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
                  margin:
                      EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                  borderOnForeground: false,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                            width: width * 0.08,
                          ),
                          Image.asset("assets/Images/Home/invitation.png",
                              width: width * 0.1),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Invitation',
                            style: TextStyle(
                                fontSize: height * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          )
                        ]),
                  )),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Colors.green.shade900,
                      Colors.black12,
                      Colors.orange.shade500,
                    ])),
              ),
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
