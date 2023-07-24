import 'package:flutter/material.dart';
import 'notification_service.dart';

class UserCategoryDetailsShownPage extends StatefulWidget {
  final String eventName;
  UserCategoryDetailsShownPage({Key? key, required this.eventName})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserCategoryDetailsShownPageState createState() =>
      _UserCategoryDetailsShownPageState();
}

class _UserCategoryDetailsShownPageState extends State<UserCategoryDetailsShownPage> {
  // ignore: avoid_init_to_null
  final NotificatinService notificationService = NotificatinService();

  @override
  void initState() {
    super.initState();
    notificationService.intializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),

          // padding:EdgeInsets.only(top: height * 0.02, right: width * 0.02),

          child: AppBar(
            titleSpacing: 2.2,
            forceMaterialTransparency: false,
            backgroundColor: Colors.greenAccent.shade700,
            automaticallyImplyLeading: true,
            centerTitle: true,
            flexibleSpace: Center(
              child: Text('',
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            leading: Align(
              alignment: Alignment.center,
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.greenAccent.shade700,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    // Show the calendar popup screen.
                    DateTime? chosenDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData(
                            colorScheme: ColorScheme.light().copyWith(
                              primary: Colors.greenAccent
                                  .shade700, // Change the primary color
                              onPrimary: Colors.white, // Change the text color
                            ),
                            textTheme: const TextTheme(
                              bodyLarge: TextStyle(
                                  fontSize: 18), // Change the font size
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (chosenDate != null) {
                      // Set a notification for the chosen date
                      await notificationService.showNotification(
                        0, // Provide a unique ID for the notification
                        'Notification Title',
                        'Notification Body',
                        'Notification Payload',
                      );
                    }

                    // ignore: use_build_context_synchronously
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    minimumSize: Size(100, 50),
                  ),
                  child: const Text(
                    'Remainder',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
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
