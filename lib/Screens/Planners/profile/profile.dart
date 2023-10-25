import 'dart:async';
import 'package:eventsy/Planners/profile/editProfile.dart';
import 'package:eventsy/Planners/profile/contributors.dart';
import 'package:eventsy/Planners/profile/share.dart';
import 'package:eventsy/model/currentId.dart';
import 'package:eventsy/model/currentPlanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import '../search/search.dart';
//import 'package:http/http.dart' as http;

currentId currentuser = currentId();
int currentUserId = currentuser.currentUserId;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CurrentPlanner currentPlanner = CurrentPlanner();

  List userData = [];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      List data = await currentPlanner.getCurrentPlanner();
      setState(() {
        userData = data;
        //print(userData[0]['friends']);
        //print(userData[0]['friends'][1]['pivot']['status']);  // to print the status of friend request
      });
    } catch (e) {
      // Handle error
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          header(),
          drawerList(),
        ],
      ),
    );
  }

  Widget header() {
    if (userData.isNotEmpty) {
      // Only access userData if it's not empty
      return Container(
        color: const Color.fromARGB(255, 18, 140, 126),
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(userData[0]['profileIMG']),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => edit_profile(user: userData)));
              },
            ),
            Text(
              userData[0]['name'],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              userData[0]['email'],
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      );
    } else {
      // Handle loading state or no data available
      //return const Center(child: CircularProgressIndicator(color:Color.fromARGB(255, 18, 140, 126),));
      // return const Center(
      //     child: Padding(
      //       padding: EdgeInsets.all(20.0),
      //       child: CupertinoActivityIndicator(
      //           radius: 20.0,
      //           color: Color.fromARGB(255, 18, 140, 126),
      //           ),
      //     ));

      return Container(
        color: const Color.fromARGB(255, 18, 140, 126),
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.only(top: 10.0),
        child:const CupertinoActivityIndicator(
                radius: 20.0,
                color: Colors.white,
                ),
      );
    }
  }

  Widget drawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          menuItem(1, 'Promotion', Icons.self_improvement),
          menuItem(3, 'Contributors', Icons.group),
          menuItem(4, 'Share', Icons.share),
          menuItem(5, 'Edit', Icons.edit),
          menuItem(6, 'Help & Support', Icons.help),
          menuItem(7, 'Contact us', Icons.contact_mail),
          const Divider(height: 2.0),
          menuItem(8, 'Settings', Icons.settings),
          menuItem(9, 'Notifications', Icons.notifications),
          const Divider(height: 2.0),
          menuItem(10, 'Log out', Icons.logout),
        ],
      ),
    );
  }

  Future<void> bottomSheet() {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: const EdgeInsets.all(30.0),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'This feature will be implement later or it will not available to you at the moment',
                      style: TextStyle(fontSize: 20.0, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ));
        });
  }

  Widget menuItem(int id, String title, IconData icon) {
    //Widget _page = Profile();
    return Material(
      child: InkWell(
        onTap: () {
          switch (id) {
            case 1:
              bottomSheet();
              break;
            case 2:
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Contributors()));
              break;
            case 4:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRCodeGenerator(
                          data: "https://wa.me/${userData[0]['contact']}")));
              break;
            case 5:
              if (currentUserId > 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => edit_profile(user: userData)));
              }
              break;
            case 6:
              bottomSheet();
              break;
            case 7:
            case 8:
            default:
              bottomSheet();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              )),
              Expanded(
                  flex: 5,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//enum DrawerSections { dashboard, contacts, events }
