
import 'package:eventsy/Screens/Planners/profile/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();

  static fromMap(String msg) {}
}

class _MessageState extends State<Message> {
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Request()));
            },
            icon: const Icon(Icons.group_add),
          )
        ],
      ),
      body: const Center(
        child: Text("Message page"),
      ),
    );
  }
}
