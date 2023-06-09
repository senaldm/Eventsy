// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // @override
  // Widget build(BuildContext context) {
  //   return Container(

  //   );
  // }

// const AddTask({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category = "birthday";
    bool isComplete = false;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
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
                child: Text(
                  'Task List',
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                borderOnForeground: false,
                // child:DropdownButton<String>(
                //   value:category,
                //   items: <String>['Birthday','Ceremony','Wedding'].map<DropDownItem<String>>((String value){
                //   }).toList(),
                // )
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                borderOnForeground: false,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task Name',
                    hintText: 'Enter Task Name',
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                borderOnForeground: false,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vendor Name',
                    hintText: 'Enter Vendor Name',
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    EdgeInsets.only(left: width * 0.15, right: width * 0.15),
                borderOnForeground: false,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Budget',
                    hintText: 'Enter budget ',
                  ),
                ),
              ),
//               Switch(
//                 trackColor: MaterialStateProperty.all(Colors.black38),
//                 activeColor: Colors.green.withOpacity(0.4),
//                 inactiveThumbColor: Colors.red.withOpacity(0.4),
// // when the switch is on, this image will be displayed
//                 activeThumbImage:
//                      AssetImage('assets/Images/Task/completeTask.png'),
// // when the switch is off, this image will be displayed
//                 inactiveThumbImage:
//                      AssetImage('assets/Images/Task/incompleteTask.png'),
//                 value: isComplete,
//                 onChanged: (value) => setState(() => isComplete = value),
//               ),
            ],
          ),
          // bottomNavigationBar: BottomAppBar(
            
          //     child: Column(
                
          //   children: [
          //     Row(children: [
          //       FloatingActionButton.extended(
          //           onPressed: () {},
          //           label: Text(
          //             "cancel",
          //             style: TextStyle(color: Colors.white),
          //           )),
          //       FloatingActionButton.extended(
          //           onPressed: () {},
          //           label: Text(
          //             "Save",
          //             style: TextStyle(color: Colors.white),
          //           )),
          //     ])
          //   ],
          // )),
        bottomNavigationBar: BottomAppBar(
        color: Colors.greenAccent.shade700,
        height: 90,
        child:Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {
                        Navigator.pushNamed(context, '/TaskList');
                },
              backgroundColor: Colors.blueGrey.shade900 ,
               label: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              
                FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.pushNamed(context, '/TaskList');
                        },
                        backgroundColor: Colors.blueGrey.shade900,
                        label: Text(
                          ' Save ',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
            ],
          ),

            )

        )
        )
        );
  }
}
