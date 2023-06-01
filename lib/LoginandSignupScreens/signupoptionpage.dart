import 'package:flutter/material.dart';
import 'package:loginsignup/LoginandSignUpScreens/services/firebase_services.dart';

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
          body: Center(
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
                        return Colors.white30;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  height: 60, // Adjust the width as needed
                  child: ElevatedButton(
                    onPressed: () {
                      signInWithGoogle(context);
                      // Handle second button press
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.white30;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: const Text(
                      'SignUp with Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
