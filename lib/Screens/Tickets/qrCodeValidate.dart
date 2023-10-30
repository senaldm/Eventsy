// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class TicketValidationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TicketValidationScreenState();
}

class _TicketValidationScreenState extends State<TicketValidationScreen> {
 
  bool isValidated = true;

 
  bool userWantsManualClose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventsy Validation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              isValidated ? Icons.check : Icons.close,
              color: isValidated ? Colors.green : Colors.red,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              isValidated ? "Ticket Validated" : "Invalid Ticket",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),

            Text(
              "Ticket Details: Your ticket details go here...",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
        
            CountdownTimer(
              endTime: DateTime.now().millisecondsSinceEpoch +
                  5000, 
              textStyle: TextStyle(fontSize: 48.0),
              onEnd: () {
                if (!userWantsManualClose) {
                  Navigator.pop(
                      context); 
                }
              },
            ),
            if (userWantsManualClose)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: const Text("Close"),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Scan the next ticket after the countdown ends",
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
