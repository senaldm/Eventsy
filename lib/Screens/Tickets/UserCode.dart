// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class UserCode extends StatelessWidget {

  
   UserCode({super.key});

  final userCode = TextEditingController();
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
                    // physics: NeverScrollableScrollPhysics(),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: EdgeInsets.only(
                                  left: width * 0.15, right: width * 0.15),
                              borderOnForeground: false,
                              child: Hero(
                                tag: 'UserVerifyCode',
                                child: TextField(
                                  controller: userCode,
                                  // onChanged: (value) {
                                  //   vendorName:
                                  //   value;
                                  // },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    prefixIcon:
                                        Icon(Icons.business_center_outlined),
                                    hintText: 'User Verification Code',
                                  ),
                                ),
                              ),
                            ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child:TextButton(
                                 
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/QrCodeScanner');
                                  }, 
                                   child:Text('   Start To Scan   '),
                              )),
                              
                            ],
                           ),
                               
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
             Navigator.pushNamed(context, '/ticketHandlingHome');
            return false;
          },
        ));
  }
}