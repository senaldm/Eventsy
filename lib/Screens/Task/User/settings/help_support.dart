import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';


class FeedbackAndContactPage extends StatelessWidget {
  TextEditingController feedbackController = TextEditingController();

  Future<void> sendFeedback(String feedback) async {
    final Email email = Email(
      body: feedback,
      subject: 'Feedback from App User',
      recipients: ['contact@example.com'], // Replace with your email address
    );

    await FlutterEmailSender.send(email);
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
      child: Scaffold(       
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor:Color.fromARGB(255, 18, 140, 126),
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Help & Support',
                    style: TextStyle(
                        fontSize: width * 0.05,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            ExpansionTile(
                  title: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  children: [
                    GestureDetector(
                      onTap: () => _launchGmail('contact@example.com'),
                      child: Text(
                        'Email: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // Set email text color
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _launchGmail('contact@example.com'),
                      child: SelectableText(
                        'contact@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Set email text color
                        ),
                      ),
                    ),
                  ],
                ),


               Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
              ExpansionTile(
                title: Text(
                  'Give Feedback',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: Colors.white,
                  ),
                ),
                children: [
                  TextField(
                    controller: feedbackController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback...',
                      hintStyle: TextStyle(
                        color: Colors.white70, // Set hint text color
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 18, 140, 126),
                           // Set feedback input border color
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor:  Colors.blueGrey.shade900, // Set feedback input field color
                    ),
                    style: TextStyle(
                      color: Colors.white, // Set feedback input text color
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      sendFeedback(feedbackController.text);
                      feedbackController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Feedback sent successfully.',
                            style: TextStyle(
                              fontSize: width * 0.02,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                    primary:  Color.fromARGB(255, 18, 140, 126), // Set button color to black
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(25), // Set border radius
                      ),
                    ),
                    child: Text('Send'),
                    
                  ),
                ],
              ) ,
               Divider(thickness: 1,
                  color:Colors.white.withOpacity(0.3),),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
            color:  Color.fromARGB(255, 18, 140, 126),
            height: height*0.11,
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

  Future<void> _launchGmail(String emailAddress) async {
  final Uri uri = Uri(
    scheme: 'mailto',
    path: emailAddress,
  );

  // Use a custom URL scheme for Gmail
  final gmailUri = Uri(
    scheme: 'googlegmail',
    path: 'co',
    queryParameters: {'to': emailAddress},
  );

  // Launch the Gmail app using the custom URL scheme
  if (await canLaunch(gmailUri.toString())) {
    await launch(gmailUri.toString());
  } else {
    // If Gmail app is not installed, use the mailto scheme as a fallback
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch email app.';
    }
  }
}


}
