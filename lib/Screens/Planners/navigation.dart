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

  void onTapped(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 219, 219, 219),
        bottomNavigationBar: CurvedNavigationBar(
          index: _activePageIndex,
          backgroundColor: Color.fromARGB(255, 219, 219, 219),
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
