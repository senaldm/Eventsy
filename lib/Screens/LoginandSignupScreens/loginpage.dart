import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventsy/Screens/LoginandSignUpScreens/reusable_widgets/resusable_widget.dart';
import 'package:eventsy/Screens/LoginandSignUpScreens/services/firebase_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool isPasswordType = false;
  String? confirmPasswordError;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Log In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        //leading: Icon(Icons.arrow_back, size: 40),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                //LoginWidget("assets/images/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextFeild(
                  "Enter  EmailID",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    autofocus: false,
                    controller: _passwordTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Please enter the valid password";
                      }
                    },
                    onSaved: (value) {
                      _passwordTextController.text = value!;
                    },
                    obscureText: !isPasswordType,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordType
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordType = !isPasswordType;
                            });
                          }),
                      labelText: "Enter  Password",
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                      ),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    keyboardType: isPasswordType
                        ? TextInputType.visiblePassword
                        : TextInputType.emailAddress,
                  ),
                ),
                if (confirmPasswordError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      confirmPasswordError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                signInSignupButton(context, true, () async {
                  if (_emailTextController.text.isEmpty ||
                      _passwordTextController.text.isEmpty) {
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
                  } else {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );
                      // Sign-in successful, navigate to the home screen
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, './LogOutScreen');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
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
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'The password is incorrect.',
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
                      } else if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'The user is not found.',
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
                              'An error occurred while signing in.',
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'An error occurred while signing in.',
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
                }),

                signUpOption(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton.icon(
                    icon:
                    // Icon(Icons.google),
                     const FaIcon(
                      FontAwesomeIcons.google,
                       color: Colors.black,
                    ),
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
                                    borderRadius: BorderRadius.circular(30)))),
                    label: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /// Image.asset(
                            // "assets/images/googlelog.png",
                            // width: 40,
                            // height: 40,
                            // ),

                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Login With Gmail",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
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

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have An Account ? ",
            style: TextStyle(
              color: Colors.white70,
            )),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, './SignUpOptionPage');
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
