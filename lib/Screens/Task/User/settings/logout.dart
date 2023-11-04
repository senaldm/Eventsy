import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 18, 140, 126), // Set button color to black
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Set border radius
                    ),
                  ),
                  onPressed: () {
                    // Code to execute when "Yes" button is clicked
                    // For example, you can add code here to clear user session and navigate to the login page.
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 18, 140, 126), // Set button color to black
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Set border radius
                    ),
                  ),
                  onPressed: () {
                    // Code to execute when "No" button is clicked
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child:Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
         child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor:Color.fromARGB(255, 18, 140, 126),
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Logout',
                    style: TextStyle(
                        fontSize: width * 0.06,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
      ),
      body: Stack(
          fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/Home/bodyBack4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _showLogoutConfirmation(context);
              },
              child: Icon(
                Icons.logout,
                size: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
            color:  Color.fromARGB(255, 18, 140, 126),
            height: height*0.10,
            ),
    ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LogoutPage(),
  ));
}
