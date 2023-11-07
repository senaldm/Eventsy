// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class TicketValidationScreen extends StatefulWidget {
  List<dynamic> ticketDetails;
  String scannedQRCode;
  TicketValidationScreen(
      {required this.scannedQRCode, required this.ticketDetails});

  @override
  State<StatefulWidget> createState() => _TicketValidationScreenState();
}

class _TicketValidationScreenState extends State<TicketValidationScreen> {
  bool isValidated = false;
  late String qrCode;
  late List<dynamic> ticketData;
  late List<String> ticketKeys;
  late String ticketType;

  @override
  void initState() {
    super.initState();
    qrCode = widget.scannedQRCode;
    ticketData = widget.ticketDetails;

    addTicketKeys();
    checkValidation();
    resetIsValidate();
  }

  resetIsValidate() {
    setState(() {
      isValidated = false;
    });
  }

  void addTicketKeys() {
    ticketKeys =
        ticketData.map((item) => item['ticketKey'].toString()).toList();

    //print(ticketKeys);
  }

  void checkValidation() {
    String matchingKey = '';
    for (String key in ticketKeys) {
      if (qrCode == key) {
        print(qrCode);
        matchingKey = key;
        var ticket =
            ticketData.firstWhere((item) => item['ticketKey'] == qrCode);
        ticketType = ticket['ticketType'];
        //   isValidated = false;
        break;
      }
      print("it wasnt equal");
    }

    // if (matchingKey != '') {
    //   isValidated = true;
    // }
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
          backgroundColor: Colors.blueGrey.shade900,
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),

            // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

            child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor: Color.fromARGB(255, 18, 140, 126),
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text(
                  'Eventsy Validation',
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontFamily: 'Roboto',
                      // fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isValidated
                    ? Column(children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 100.0,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Ticket Validated",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Text(
                        //   "Ticket Type: $ticketType",
                        //   style: TextStyle(
                        //     fontSize: 16.0,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ])
                    : Column(
                        children: [
                          Icon(
                            Icons.close_rounded,
                            color: Colors.red,
                            size: 100.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Ticket Invalidated",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 20.0),
                CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch + 10000,
                  textStyle: TextStyle(fontSize: 48.0),
                  onEnd: () {
                    Navigator.pushNamed(context, '/qrCodeScanner',
                        arguments: ticketData);
                  },
                ),
                Positioned(
                  bottom: height * 0.05,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Ready for Next Ticket",
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

        
        ),
        onWillPop: () async {
          Navigator.pushNamed(context, '/qrCodeScanner', arguments: ticketData);
          return false;
        },
      ),
    );
  }
}
