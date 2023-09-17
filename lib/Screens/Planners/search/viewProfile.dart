import 'dart:async';
import 'dart:convert';
//import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventsy/Model/Planner/currentId.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

currentId currentuser = currentId();
int currentuserid = currentuser.currentUserId;

class ViewProfile extends StatelessWidget {
  final List list;
  final int person;

  const ViewProfile({Key? key, required this.list, required this.person})
      : super(key: key);

  Future<void> addFriend(int id) async {
    String hire = "http://127.0.0.1:8000/api/hire/$currentuserid/$id";
    final Uri url = Uri.parse(hire);
    print(url);

    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        print("Request was successful");
        print("Response body: ${response.body}");
      } else {
        print("Request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: Colors.green,
          title: title(),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            carousel(),
            const Divider(height: 2, color: Colors.white),
            contact(),
            const Divider(height: 2, color: Colors.white),
            name(),
            const Divider(height: 2, color: Colors.white),
            about(),
            const Divider(height: 2, color: Colors.white),
            service(),
            const Divider(height: 2, color: Colors.white),
            friends(),
            const Divider(height: 2, color: Colors.white),
            history(),
            const Divider(height: 2, color: Colors.white),
          ],
        ),
        persistentFooterButtons: <Widget>[footer()]);
  }

  Widget title() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      CircleAvatar(backgroundImage: NetworkImage(list[person]['profileIMG'])),
      const SizedBox(width: 20.0),
      SizedBox(
        child: Text(
          list[person]['name'], // index - 1 is name
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ]);
  }
  /*
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
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(list[person]['profileIMG'])),
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
  }*/

  Widget carousel() {
    List<String> imageList = [
      list[person]['image1'],
      list[person]['image2'],
      list[person]['image3'],
      // Add more image URLs or local asset paths as needed
    ];

    return SingleChildScrollView(
      child: SizedBox(
          height: 250,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200, // Set the desired height of the carousel
              autoPlay: true, // Enable auto-play
              aspectRatio: 16 / 9, // Adjust the aspect ratio of the images
              enlargeCenterPage: true, // Make the center image larger
              // You can configure more options as per your requirements
            ),
            items: imageList.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          )),
    );
  }

  Widget contact() {
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
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      String mail = "mailto:${list[person]['email']}";
                      final Uri url = Uri.parse(mail);
                      //print(mail);
                      launchUrl(url);
                    }),
                IconButton(
                    icon: const Icon(Icons.chat,color: Colors.green,),
                    onPressed: () {
                      String whatsapp =
                          "https://wa.me/${list[person]['contact']}?text=Hi this message is through Eventsy";
                      final Uri url = Uri.parse(whatsapp);
                      //print(whatsapp);
                      launchUrl(url);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget name() {
    return Container(
      padding: EdgeInsets.all(20),
      height: 90,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(list[person]['name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                const Text('Professional Event Planner',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic)),
              ],
            ),
            printRate(list[person]['rate']),
          ]),
    );
  }

  Widget printRate(int rate) {
    String stars = '';
    for (int i = 0; i < rate; i++) {
      stars += '⭐ ';
    }
    return SizedBox(
      child: Text(
        stars,
        style: const TextStyle(
            color: Colors.amber, fontSize: 23.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget about() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                list[person]['description'],
                style: const TextStyle(color: Colors.white, fontSize: 15.0),
              )
            ]));
  }

  Widget history() {
    List serviceList;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: const Text(
            'Previous Events',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: list[person]['services'].length,
          itemBuilder: (context, i) {
            //print(list[person]['services']);
            serviceList = list[person]['services'];
            return ListTile(
              //leading: const Icon(Icons.bubble_chart_rounded),
              leading: Text(
                serviceList[i]['serviceName'],
                style: const TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            );
          },
        )),
      ]),
    );
  }

  Widget service() {
    List serviceList;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: const Text(
            'Services By Planner',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: list[person]['services'].length,
          itemBuilder: (context, i) {
            //print(list[person]['services']);
            serviceList = list[person]['services'];
            return ListTile(
              //leading: const Icon(Icons.bubble_chart_rounded),
              leading: Text(
                serviceList[i]['serviceName'],
                style: const TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            );
          },
        )),
      ]),
    );
  }

  Widget friends() {
    List friendList;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: const Text(
            'Contributers with Planner',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: list[person]['friends'].length,
          itemBuilder: (context, i) {
            friendList = list[person]['friends'];
            return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              CircleAvatar(
                  backgroundImage: NetworkImage(friendList[i]['profileIMG'])),
              const SizedBox(width: 20.0),
              SizedBox(
                child: Text(
                  friendList[i]['name'], // index - 1 is name
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]);
          },
        )),
      ]),
    );
  }

  Widget footer() {
    //String button = "Hire";
    if (list[person]['plannerID'] == currentuserid) {
      return const SizedBox(
        height: 0,
      );
    }
    return ElevatedButton(
        onPressed: () {
          addFriend(list[person]['plannerID']);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        child: const Text("Hire",
            style: TextStyle(fontSize: 20, color: Colors.black)));
  }
}
