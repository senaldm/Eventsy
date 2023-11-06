import 'package:eventsy/User/projects/viewProject.dart';
import 'package:eventsy/model/User/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {

  Projects projects = Projects();
  List completed = [];

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                complete(),
              ],
            )));
  }

  
  Widget complete() {
    return Expanded(
      child: FutureBuilder<List>(
          future: projects.getComplete(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              completed = snapshot.data!;
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: completed.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      child: Card(
                        color: Colors.black87,
                        child: Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Image.network(
                                completed[i]['profileIMG'],
                                fit: BoxFit.fill)),
                            const SizedBox(width: 20.0),
                            
                                  printName(completed[i]['name']),
                               
                        ]),
                      ),
                      onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProject(person: [completed[i]])));
                          },
                    );
                  });
            } else {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 15.0,
                  color: Color.fromARGB(255, 18, 140, 126),
                ),
              );
            }
          })),
    );
  }

  Widget printName(String name) {
    return Text(name,
        style: const TextStyle(
            color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.bold));
  }

  Widget action(int friendID)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 30,
          width: 120,
          child: ElevatedButton(
            onPressed: () async {
             showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Reject?'),
                            content: const Text(
                                'Are you sure you want to reject this request?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog and navigate back without saving
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // bool result = await delete(friendID);
                                  // if (result) {
                                  //   Navigator.of(context).pop();
                                  // }
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              'Reject',
              style: TextStyle(
                  fontSize: 15,
                  //letterSpacing: 2,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //const SizedBox(width: 10.0),
        // for accept the request
        SizedBox(
          height: 30,
          width: 120,
          child: ElevatedButton(
            onPressed: () async {
              // //bool result = await accept(friendID);
              // if (result) {
              // }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 18, 140, 126),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              'Accept',
              style: TextStyle(
                  fontSize: 15,
                  //letterSpacing: 2,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                  ),
            ),
          ),
        )
      ],
    );
  }

}