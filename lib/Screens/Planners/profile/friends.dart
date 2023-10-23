import 'package:eventsy/Screens/Planners/search/viewProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  final List list;
  const Friends({Key? key, required this.list}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.green,
        title: Text('Friends'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [friends()],
      ),
    );
  }

 Widget friends() {
    List list = widget.list;
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: const Text(
              'Contributers with You',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            //physics: const BouncingScrollPhysics(),
            itemCount: list[0]['friends'].length,
            itemBuilder: (context, i) {
          List friend = list[0]['friends'];
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 15,
              color: Colors.black87,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Image.network(friend[i]['profileIMG'],
                          fit: BoxFit.fill)),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friend[i]['name']),
                        const Text('Event Planner',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic)),
                        Text(friend[i]['rate']),
                        Text(friend[i]['email']),
                        Text(friend[i]['location'])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewProfile(list: friend, person: i)));
            },
          );
            },
          )
        ]));
  }

}
