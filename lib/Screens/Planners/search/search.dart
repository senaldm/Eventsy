import 'package:eventsy/Screens/Planners/search/viewProfile.dart';
import 'package:eventsy/Model/Planner/planner.dart';
//import 'package:eventsy/widgets/listWidget.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Planners planners = Planners();
  List listCopy = [];

  List _foundPlanners = [];
  @override
  void initState() {
    _foundPlanners = listCopy;
    super.initState();
  }

  void _filterList(String keyword) {
    List results = [];
    if (keyword.isEmpty) {
      results = listCopy;
    } else {
      results = listCopy
          .where((planner) =>
              planner['email'].toLowerCase().contains(keyword.toLowerCase()) ||
              planner['name'].toLowerCase().contains(keyword.toLowerCase()) ||
              planner['place'].toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundPlanners = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Color.fromARGB(255, 219, 219, 219),
      appBar: AppBar(
          // backgroundColor: Colors.green,
          title: const Text(
            "Search",
            style: TextStyle(
              fontFamily: 'Arial',
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () {},
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            style: const TextStyle(color: Colors.green),
            decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Name or Place or Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: Colors.green),
            onChanged: (value) => _filterList(value),
          ),
          Expanded(
            child: FutureBuilder<List>(
                future: planners.getAllPlanners(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    listCopy = snapshot.data!;
                    //print(listCopy);
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _foundPlanners.length,
                      itemBuilder: (context, i) {
                        /* return Card(
                          child: ListTile(
                            leading: const Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            ),
                            title: Text(
                              _foundPlanners[i]['name'],
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 22.0),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5.0),
                                  Text(_foundPlanners[i]['email'],
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      )),
                                  const SizedBox(height: 5.0),
                                  Text(_foundPlanners[i]['place'],
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ))
                                ]),
                            trailing: Text(
                              "${_foundPlanners[i]['rate']}",
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.amber),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProfile(
                                          list: _foundPlanners, person: i)));
                            },
                          ),
                        );*/
                        return GestureDetector(
                          child: Card(
                            elevation: 15,
                            color: Colors.black87,
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    child: Image.network(
                                        'https://picsum.photos/250?image=29',
                                        fit: BoxFit.fill)),
                                const SizedBox(width: 10.0),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      printName(_foundPlanners[i]['name']),
                                      const Text('Event Planner',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontStyle: FontStyle.italic)),
                                      printRate(_foundPlanners[i]['rate']),
                                      printEmail(_foundPlanners[i]['email']),
                                      printPlace(_foundPlanners[i]['place'])
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
                                    builder: (context) => ViewProfile(
                                        list: _foundPlanners, person: i)));
                          },
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                }),
          ),
        ]),
      ),
    );
  }

  Widget printName(String name) {
    return Text(name,
        style: const TextStyle(
            color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.bold));
  }

  Widget printEmail(String email) {
    return Text(email,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.normal));
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

  Widget printPlace(String place) {
    return Text(place,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.normal));
  }
}
