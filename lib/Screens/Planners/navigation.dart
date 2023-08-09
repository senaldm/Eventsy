//import 'package:eventsy/pages/edit_profile.dart';
import 'package:eventsy/Screens/Planners/message/message.dart';
import 'package:eventsy/Screens/Planners/profile/profile.dart';
import 'package:eventsy/Screens/Planners/search/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'booking/booking.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _activePageIndex = 0;
  final List<Widget> _pages = [Search(), Message(), Booking(), Profile()];

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // This will call _showLoginScreen after the first frame is built
      _showLoginScreen(context);
    });
  }

  void onTapped(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  void _showLoginScreen(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blueGrey.shade900,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Eventsy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please log in or sign up to continue.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'LoginPage');
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('Login'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, './SignUpPage');
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('Sign Up'),
            ),
          ],
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        bottomNavigationBar: CurvedNavigationBar(
          index: _activePageIndex,
          backgroundColor: Colors.blueGrey.shade900,
          color: Colors.green,
          //animationCurve: Curves.easeOut,
          items: const <Widget>[
            Icon(Icons.search),
            Icon(Icons.message),
            Icon(Icons.book),
            Icon(Icons.person),
          ],
          onTap: onTapped,
        ),
        body: _pages[_activePageIndex],
      ),
    );
  }
}
