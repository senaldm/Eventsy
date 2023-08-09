import 'package:flutter/material.dart';

class PasswordChangePage extends StatefulWidget {
  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  bool showPasswordFields = false;
  bool showCurrentPassword = false;
  bool showNewPassword = false;
  bool showConfirmPassword = false;

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text('Privacy & Security',
                  style: TextStyle(
                      fontSize: width * 0.07,
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
          child: Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 0, left: 0, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Color(0xFF4D4A4A), // Set the color of the line
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 3, left: 20, right: 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Code to execute when "Change Password" button is clicked
                      setState(() {
                        showPasswordFields = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900
                          .withOpacity(0.1), // Set button color to black
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Set border radius
                      ),
                    ),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05), // Set button text color
                    ),
                  ),
                ),
                if (showPasswordFields)
                  Column(
                    children: [
                      _buildPasswordTextField('Current Password'),
                      _buildPasswordTextField('New Password'),
                      _buildPasswordTextField('Confirm Password'),
                    ],
                  ),
                Divider(
                  color: Color(0xFF4D4A4A), // Set the color of the line
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 3, left: 20, right: 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Code to execute when "Privacy and Policies" button is clicked
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Privacy and Policies'),
                            content: Text('This is the privacy and policies message.'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 18, 140, 126)), 
                                      // Set button color
                                ),
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.white), // Set button text color
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900
                          .withOpacity(0.1), // Set button color to black
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Set border radius
                      ),
                    ),
                    child: Text(
                      'Privacy and Policies',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05), // Set button text color
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white.withOpacity(0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(String label) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left:20),
             width: 45,
             height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
              color:  const Color.fromARGB(255, 13, 18, 20), // Set the desired blue color here
            ),
            child: Icon(
              Icons.lock,
              color: Colors.grey,
              size: 30.0,
            ),
          ), // First icon
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    obscureText: label == 'Current Password'
                        ? !showCurrentPassword
                        : label == 'New Password'
                            ? !showNewPassword
                            : !showConfirmPassword,
                    decoration: InputDecoration(
                      labelText: label,
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
                      hintStyle: TextStyle(
                          color: Colors.white), // Set input hint text color
                      fillColor: Colors.transparent, // Set input field color
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.white), // Set input text color
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: label == 'Current Password'
                ? showCurrentPassword
                    ? Icon(Icons.visibility, color: Colors.white)
                    : Icon(Icons.visibility_off, color: Colors.white)
                : label == 'New Password'
                    ? showNewPassword
                        ? Icon(Icons.visibility, color: Colors.white)
                    : Icon(Icons.visibility_off, color: Colors.white)
                    : showConfirmPassword
                        ? Icon(Icons.visibility, color: Colors.white)
                    : Icon(Icons.visibility_off, color: Colors.white),
            onPressed: () {
              _togglePasswordVisibility(label);
            },
          ),
        ],
      ),
    );
  }

  // Add this function to toggle the password visibility
  void _togglePasswordVisibility(String label) {
    setState(() {
      if (label == 'Current Password') {
        showCurrentPassword = !showCurrentPassword;
      } else if (label == 'New Password') {
        showNewPassword = !showNewPassword;
      } else if (label == 'Confirm Password') {
        showConfirmPassword = !showConfirmPassword;
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: PasswordChangePage(),
    theme: ThemeData(
      primarySwatch: MaterialColor(0xFF128C7E, {
        50: Color(0xFFE2F0ED),
        100: Color(0xFFB5DAD3),
        200: Color(0xFF83C0B8),
        300: Color(0xFF52A697),
        400: Color(0xFF28917F),
        500: Color(0xFF128C7E), // Set primary swatch color
        600: Color(0xFF117A6E),
        700: Color(0xFF0F665B),
        800: Color(0xFF0D5450),
        900: Color(0xFF084035),
      }),
      backgroundColor: Colors.black, // Set default background color
      scaffoldBackgroundColor: Colors.black, // Set scaffold background color
    ),
  ));
}
