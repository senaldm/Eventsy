import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:connectivity/connectivity.dart' as connectivity;

Future<bool> checkInternetConnectivity() async {
  var connectivityResult =
      await (connectivity.Connectivity().checkConnectivity());
  if (connectivityResult == connectivity.ConnectivityResult.none) {
    return false; // No internet connection
  }
  return true; // Internet connection is available
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId:
                '667846412743-tpv39oigkelhj265fup5mcq69so73ntj.apps.googleusercontent.com')
        .signIn();
    bool isInternetConnected = await checkInternetConnectivity();

    if (!isInternetConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "No internet connection. Please check your network settings.",
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
      return; // Do not proceed with sign-in if there's no internet
    }
    if (googleUser != null) {
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      if (googleAuth != null) {
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print(userCredential.user?.displayName);
        print(userCredential.user?.email);

        if (userCredential.user != null) {
          // Sign-in successful, navigate to the logout page
          Navigator.pushNamed(context, './LogOutScreen');
        } else {
          // Sign-in failed, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Failed to sign in with Google.',
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
        }
      } else {
        // Handle the case when googleAuth is null
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'An error occurred while signing in with Google.',
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
      }
    } else {
      // Handle the case when googleUser is null
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed to sign in with Google.',
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
    }
  } catch (e) {
    // Handle any errors that occur during the sign-in process
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'An error occurred while signing in with Google.',
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
  }
}
