import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SimpleRatingBar extends StatefulWidget {
  @override
  _SimpleRatingBarState createState() => _SimpleRatingBarState();
}

class _SimpleRatingBarState extends State<SimpleRatingBar> {
  double _rating = 0;
  int _ratePercentage = 0;

  void _onRatingChanged(double rating) {
    setState(() {
      _rating = rating;
      _ratePercentage = (_rating * 20).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            titleSpacing: 2.2,
            //forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text('Rate Us',
                  style: TextStyle(
                      fontSize: width * 0.06,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rating Bar Widget
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 5; i++)
                        IconButton(
                          onPressed: () => _onRatingChanged(i.toDouble()),
                          icon: Icon(
                            i <= _rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 40,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Rate: $_ratePercentage%',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            color:  Color.fromARGB(255, 18, 140, 126),
            height: height*0.10,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  FloatingActionButton.extended(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/TaskList');
                    },
                    backgroundColor: Colors.blueGrey.shade900,
                    label: Text(
                      ' Back ',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                                    FloatingActionButton.extended(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/TaskList');
                    },
                    backgroundColor: Colors.blueGrey.shade900,
                    label: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

