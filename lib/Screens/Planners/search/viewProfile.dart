//import 'dart:async';
//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

//import 'package:url_launcher/url_launcher.dart';

class ViewProfile extends StatelessWidget {
  final List list;
  final int person;

  const ViewProfile({Key? key, required this.list, required this.person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> map = jsonDecode(list);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          header(),
          about(),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.0),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://picsum.photos/250?image=29')),
            ),
          ),
          Text(
            list[person]['name'], // index - 1 is name
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            list[person]['email'], //index -2 is email
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget about() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Contact",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.mail,
                    ),
                    onPressed: () {
                      String mailUrl = "mailto:${list[person]['email']}";
                      //launchUrl(mailUrl as Uri);
                    }),
                IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      //launchUrl("https://wa.me/${list[person]['contact']}" as Uri);
                    })
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "About",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(list[person]['about'],
              style: const TextStyle(color: Colors.black, fontSize: 15)),
          const Divider(color: Colors.green),
          const Text(
            "Past Projects",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(list[person]['about'],
              style: const TextStyle(color: Colors.black, fontSize: 15)),
          const Divider(color: Colors.green),
          const Text(
            "Other services by me",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(list[person]['about'],
              style: const TextStyle(color: Colors.black, fontSize: 15)),
          const Divider(color: Colors.green),
        ],
      ),
    );
  }
}
