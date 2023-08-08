import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _notificationEnabled = true; // Track the notification state

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text('Notifications',
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.0, vertical: width * 0.3),
              child: Column(
                children: [
                   Divider(
                  color: Color(0xFF4D4A4A), // Set the color of the line
                  thickness: 1,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                        child: Text(
                          'Enable Notifications',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(left: 50),
                        child: Switch(
                          value: _notificationEnabled,
                          onChanged: (newValue) {
                            setState(() {
                              _notificationEnabled = newValue;
                            });
                             if (_notificationEnabled) {
                          _showAlertDialog(context, 'Notifications Enabled');
                        } else {
                          _showAlertDialog(context, 'Notifications Disabled');
                        }
                          },
                        activeColor: Color.fromARGB(255, 18, 140, 126),
                        inactiveTrackColor: Colors.white,
                        inactiveThumbColor: Colors.grey,
                        
                        ),
                      ),
                    ],
                  ),
                  Divider(
                  color: Color(0xFF4D4A4A), // Set the color of the line
                  thickness: 1,
                ),
                ],
              ),
            ),
          ],
        ),
         bottomNavigationBar: BottomAppBar(
            color:  Color.fromARGB(255, 18, 140, 126),
            height: height*0.11,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/TaskList');
                    },
                    backgroundColor: Colors.blueGrey.shade900,
                    label: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/TaskList');
                    },
                    backgroundColor: Colors.blueGrey.shade900,
                    label: Text(
                      ' Back ',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification Status'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

