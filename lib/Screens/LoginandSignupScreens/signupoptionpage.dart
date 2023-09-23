import 'package:flutter/material.dart';
import 'package:eventsy/Screens/LoginandSignUpScreens/services/firebase_services.dart';

class SignUpOptionPage extends StatefulWidget {
  const SignUpOptionPage({Key? key}) : super(key: key);

  @override
  State<SignUpOptionPage> createState() => _SignUpOptionPageState();
}

class _SignUpOptionPageState extends State<SignUpOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: WillPopScope(
            onWillPop: () async {
                Navigator.popUntil(context, ModalRoute.withName('LoginPage'));
              return false;
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    height: 60, // Adjust the width as needed
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, './SignUpPage');

                        // Handle first button press
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white;
                          }
                          return Colors.white;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () {
                        signInWithGoogle(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white38;
                          }
                          return Colors.white;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Add the Google logo here with its original colors
                          Image.asset(
                            'assets/Images/auth/googleIcon.png', // Replace with the path to your Google logo image
                            width: 30, // Adjust the width as needed
                            height: 30, // Adjust the height as needed
                          ),
                          SizedBox(
                              width:
                                  20), // Add spacing between the logo and text
                          Text(
                            "Login With Gmail",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
