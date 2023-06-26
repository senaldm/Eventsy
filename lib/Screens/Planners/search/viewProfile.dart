//import 'dart:async';
//import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
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
        ],
      ),
    );
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
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0,),
          Text(
            list[person]['description'],
            style: const TextStyle(color: Colors.white, fontSize: 15.0),
          )
        ]));
  }
}
