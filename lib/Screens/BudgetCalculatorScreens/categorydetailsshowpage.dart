import 'package:eventsy/global.dart';
import 'package:flutter/material.dart';

class CategoryDetalsShownPage extends StatefulWidget {
  final String eventName;
  CategoryDetalsShownPage({Key? key, required this.eventName})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryDetalsShownPageState createState() =>
      _CategoryDetalsShownPageState();
}

class _CategoryDetalsShownPageState extends State<CategoryDetalsShownPage> {
  // ignore: avoid_init_to_null

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        toolbarHeight: 90,
        title: const Text(
          '',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushNamed(context, './CategoryShownPage');
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  // Show the calendar popup screen.
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData(
                          colorScheme: ColorScheme.light().copyWith(
                            primary: Colors.teal, // Change the primary color
                            onPrimary: Colors.white, // Change the text color
                          ),
                          textTheme: const TextTheme(
                            bodyLarge:
                                TextStyle(fontSize: 18), // Change the font size
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  // ignore: use_build_context_synchronously
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  minimumSize: Size(100, 50),
                ),
                child: const Text(
                  'Remainder',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
