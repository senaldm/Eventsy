import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:eventsy/LoginandSignUpScreens/loginpage.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: const Text('LoggedIn'),
          centerTitle: true,
          actions: [
            TextButton(
              child: const Text(
                'LogOut',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                FirebaseAuth.instance.signOut().then((value) {
                  print("Sign Out");

                  Navigator.pushNamed(context, './LoginPage');
                });
              },
            )
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
              SizedBox(
                height: 20,
              ),
              // Text("${FirebaseAuth.instance.currentUser!.displayName}"),
              SizedBox(
                height: 20,
              ),
              // Text("${FirebaseAuth.instance.currentUser!.email}"),
            ],
          ),
        ));
  }
}
