
import 'package:eventsy/Model/Planner/currentPlanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();

  static fromMap(String msg) {}
}

class _MessageState extends State<Message> {

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
        print(userData[0]['friends'][0]['status']);
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
        // backgroundColor: Colors.green,
        title: const Text(
          "Message",
          style: TextStyle(
            fontFamily: 'Arial',
            color: Colors.white,
            //fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          friendrequests(),
        ],
      ),
    );
  }

  Widget friendrequests()
  {
     return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Requests",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        Text('data')
        ],
      ),
    );
  
  }
}
