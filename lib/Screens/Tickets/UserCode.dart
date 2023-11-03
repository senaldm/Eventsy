// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity/connectivity.dart';

class UserCode extends StatefulWidget {
  const UserCode({super.key});

  @override
  State<UserCode> createState() => _UserCodeState();
}

class _UserCodeState extends State<UserCode> {
  final userCode = TextEditingController();

   bool hasInternet=false;
  // initState() {
  //   super.initState();
  //   hasInternet=true;
  // }

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
            resizeToAvoidBottomInset: false,
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
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/Images/Home/bodyBack4.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.05,
                        right: 0,
                        left: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                    suffixIcon: Tooltip(
                                      message:
                                          "This user code has been send to QR Code creator when user creates QR Codes ",
                                      child: Icon(Icons.info),
                                    ),
                                    hintText: '   User Verification Code',
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
                                    child: TextButton(
                                  onPressed: () async {
                                    if (!hasInternet) {
                                      showRetryDialog(context);
                                      // Column(
                                      //   children: [
                                      //     // Text('No Internet Connection'),
                                      //     ElevatedButton(
                                      //       onPressed:(){
                                      //           showRetryDialog(context);}, // Show the retry dialog
                                      //        child: Text('Retry'),
                                      //     ),
                                      //   ],
                                      // );
                                    } else {
                                      // final tickets=
                                      await validateUserCode(
                                          userCode.text, context);
                                      // final tickets = "gfg";
                                      // Navigator.pushNamed(
                                      //     context, '/qrCodeScanner',
                                      //     arguments: tickets);
                                    }
                                  },
                                  child: Text('   Start To Scan   '),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: height * 0.05,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
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
                            // SizedBox(
                            //   height: height * 0.1,
                            // ),
                          ],
                        ),
                      ),
                    ],
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

  Future<dynamic> validateUserCode(String code, BuildContext context) async {
    String uri = 'https://nice-williams.34-81-183-3.plesk.page/validate/$code';

    final response = await http.get(Uri.parse(uri));
    print(response);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final ticket = data[1];
      print(ticket['ticketKey']);
      if (data.isNotEmpty) {
       Navigator.pushNamed(context, '/qrCodeScanner', arguments: data);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Opps!\nAdd correct UserCode which send to QR Code creator via Email'),
          ),
        );
      }
    }
  }

  Future<void> checkNetworkStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        hasInternet = false;
      });
    } else {
      setState(() {
        hasInternet = true;
      });
    }
  }

  Future<void> showRetryDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Connection Error',
            style: TextStyle(color: Colors.red),
          ),
          content:
              Text('Please check your network connectivity and try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User chooses not to retry
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await checkNetworkStatus();
                Navigator.of(context)
                    .pop(hasInternet); // Pass the result of the network check
              },
              child: Text('Retry'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      print("no connection error");
    }
  }
}
