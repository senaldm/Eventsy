// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eventsy/Model/Event.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:path_provider/path_provider.dart';

class UserCode extends StatefulWidget {
  const UserCode({super.key});

  @override
  State<UserCode> createState() => _UserCodeState();
}

class _UserCodeState extends State<UserCode> {
  Box<ValidationBackMethod>? validationbackMethodBox;
  late String currentValidationBackMethod;
  bool isAutomaticOn = true;
  final userCode = TextEditingController();
  final backMethod = TextEditingController();
  bool hasInternet = false;
  @override
  initState() {
    super.initState();
    openHiveBox();
    retrieveMethod();
    checkNetworkStatus();
  }

  Future<void> openHiveBox() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    validationbackMethodBox =
        await Hive.openBox<ValidationBackMethod>('validationBackMethod');
  }

  Future<void> retrieveMethod() async {
    currentValidationBackMethod =
        validationbackMethodBox!.get('backMethod').toString();

    if (currentValidationBackMethod.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/validationBackMethod.txt');
      if (await file.exists()) {
        final lines = await file.readAsLines();
        if (lines.isNotEmpty) {
          currentValidationBackMethod = lines.first;
        }
      }
    }
    setState(() {
      if (currentValidationBackMethod == 'automatic') {
        isAutomaticOn = true;
      } else {
        isAutomaticOn = false;
      }
    });
  }

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
                decoration:
                    BoxDecoration(color: Colors.transparent, boxShadow: const [
                  BoxShadow(color: Colors.black87, blurRadius: 10),
                ]),
                child: AppBar(
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
                        icon: Icon(Icons.menu_rounded, color: Colors.white70),
                        iconSize: 30.0,
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Back to Scanner Mode",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                  ),
                                  ListTile(
                                    title: isAutomaticOn
                                        ? Text("Automatic",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0))
                                        : Text("Manual",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0)),
                                    trailing: Switch(
                                      value: isAutomaticOn,
                                      onChanged: (newValue) {
                                        setState(() {
                                          isAutomaticOn = newValue;
                                        });
                                        saveAutomaticModeState(newValue);
                                      },
                                    ),
                                  ),
                                ],
                                // Text(
                                //   "Back to Scanner Mode",
                                //   style: TextStyle(color: Colors.white70),
                                // ),
                              ),
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == 0) {
                            Navigator.pushNamed(context, '/userSettings');
                          }
                        }),
                  ],
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
                                    } else {
                                      await validateUserCode(
                                          userCode.text, context);
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

  Future<void> saveAutomaticModeState(bool value) async {
    if (value) {
      currentValidationBackMethod = 'automatic';
    } else {
      currentValidationBackMethod = 'manual';
    }
    setState(() {
      isAutomaticOn = value;
    });
    await validationbackMethodBox?.put(
        'backMethod', currentValidationBackMethod as ValidationBackMethod);
  }

  Future<dynamic> validateUserCode(String code, BuildContext context) async {
    String uri = 'https://nice-williams.34-81-183-3.plesk.page/validate/$code';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
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
                Navigator.of(context).pop(false);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await checkNetworkStatus();
                Navigator.of(context).pop(hasInternet);
              },
              child: Text('Retry'),
            ),
          ],
        );
      },
    );
  }
}
