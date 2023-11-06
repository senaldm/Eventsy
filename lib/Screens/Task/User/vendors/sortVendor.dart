import 'package:flutter/material.dart';

class sortVendor extends StatefulWidget {
  const sortVendor({super.key});

  @override
  State<sortVendor> createState() => _sortVendorState();
}

class _sortVendorState extends State<sortVendor> {
    String sort = 'accentOrder';
  @override
  Widget build(BuildContext context) {
    return sortVendor();
  }
    sortVendor() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 140, 126),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "Accent Order",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "accent",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Deaccent Order",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "deaccent",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    selected: true,
                    title: Text(
                      "Newest Vendor First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "newestFirst",
                    activeColor: Colors.black87,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Oldest Vendor First",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: "oldestFirst",
                    groupValue: sort,
                    activeColor: Colors.black87,
                    onChanged: (value) {
                      setState(() {
                        sort = value.toString();
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}