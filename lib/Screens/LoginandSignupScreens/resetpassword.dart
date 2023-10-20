import 'package:eventsy/Screens/LoginandSignupScreens/reusable_widgets/resusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  bool isOnline = true;
  Future<void> checkInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      isOnline = result != ConnectivityResult.none;
    });
  }

  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popUntil(context, ModalRoute.withName('LoginPage'));
          return false;
        },
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 10, 0),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                reusableTextFeild(
                  "Enter  Email ID",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                SizedBox(
                  height: 30,
                ),
                firebaseButton(context, 'Reset Password', () async {
                  if (!isOnline) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "No Internet Connection Check Your Internet Connection!!!",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.blueGrey,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return;
                  } else if (_emailTextController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please enter all required fields.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.blueGrey,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } else if (!EmailValidator.validate(
                      _emailTextController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'The email address is not valid.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.blueGrey,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } else {
                    try {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          .then((value) =>
                              Navigator.pushNamed(context, 'LoginPage'));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        // The email address is not found in the login details
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Email address not found in the app. Please sign up.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.blueGrey,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'An error occurred. Please try again later.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.blueGrey,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        print("Firebase error: ${e.code} - ${e.message}");
                      }
                    }
                  }
                }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
