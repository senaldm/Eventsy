import 'package:flutter/material.dart';


class your_tasks extends StatelessWidget {
  //final String title;

  //const your_tasks({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      bottom: true, 
      left: true,
      right: true,
      child: Scaffold(
         backgroundColor: Colors.blueGrey.shade900,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor: Colors.greenAccent.shade700,
              automaticallyImplyLeading: true,
              centerTitle: true,
             flexibleSpace: Center(
                child: Text('Your Events',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
              ),
          ),
        ),
      body: Container(        
          //color:Colors.blueGrey.shade900, // Set the background color of the body to black
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                width: double
                    .infinity, // Expand button width to fill the container
                height: 80,
                child: const ListTile(
                  title: Center(
                    child: Text(
                      'Event Schedule',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white, // Set font color to white
                      ),
                    ),
                  ),
                ),
              ),
              const Column(
                children: <Widget>[
                  // Your other widgets
                  Divider(
                    color: Colors.white, // Set the color of the line
                    thickness: 1, // Set the thickness of the line
                  ),
                  // Your other widgets
                ],
              ),
              // Add more ElevatedButton/ListTile widgets for other tasks
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/event_details');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFD9D9D9)
                        .withOpacity(0.15), // Set button color to black
                    padding: EdgeInsets.zero, // Remove padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14), // Set border radius
                    ),
                  ),
                  child: Container(
                    width: double
                        .infinity, // Expand button width to fill the container
                    height: 60,
                    child: const ListTile(
                      title: Center(
                        child: Text(
                          'Event 2',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/event_details');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFD9D9D9)
                        .withOpacity(0.15), // Set button color to black
                    padding: EdgeInsets.zero, // Remove padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14), // Set border radius
                    ),
                  ),
                  child: Container(
                    width: double
                        .infinity, // Expand button width to fill the container
                    height: 60,
                    child: const ListTile(
                      title: Center(
                        child: Text(
                          'Event 3',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                  // Navigator.pushNamed(context, '/event_details');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFD9D9D9)
                        .withOpacity(0.15), // Set button color to black
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14), // Set border radius
                    ), // Remove padding
                  ),
                  child: Container(
                    width: double
                        .infinity, // Expand button width to fill the container
                    height: 60,
                    child: const ListTile(
                      title: Center(
                        child: Text(
                          'Event 4',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white, // Set font color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
 bottomNavigationBar: BottomAppBar(
        color: Colors.greenAccent.shade700,
        height: 90,
        child:Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {
                        //Navigator.pushNamed(context, '/TaskList');
                },
              backgroundColor: Colors.blueGrey.shade900 ,
               label: const Text(
                  'Sort',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              
                FloatingActionButton.extended(
                        onPressed: () {
                          //Navigator.pushNamed(context, '/TaskList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: const Text(
                          ' Filter ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
            ],
          ),

            )

        )
      ),
    );
  }
}
