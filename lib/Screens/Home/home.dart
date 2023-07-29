// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:device_preview/device_preview.dart';

// import 'package:eventsy/navigation.dart';
// import 'package:flutter/cupertino.dart';

// void main() async => runApp(
//       DevicePreview(
//         builder: (context) => home(),

//       ),
//     );
// void main() {
//   runApp( home());
// }
class home extends StatelessWidget {
  const home({super.key});

  selectUserMode(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final keyIsFirstLoaded = 'is_first_loaded';
    // bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    // if (isFirstLoaded == null) {

    return AlertDialog(
      title:   Text(
        'General mode',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.07),
        textAlign: TextAlign.center,
      
      ),
      backgroundColor: Colors.blueGrey.shade900,
      content: Form(
        // onChanged: Navigator.pop(context),
        child: Column(
          
           mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
              
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
                
              //   ],
              // ),
              // SizedBox(height: width*0.09,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:"General mode is a simple user who use this app for plan their own event.  Continue as ",
                      style: TextStyle(color:Color.fromARGB(255,37,211,102)),
                      children:const [
                        TextSpan(text: '\'General mode\' ',style:TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text:' or ' ),
                        TextSpan(text:' \'Next\'  ',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'to see other user mode')
                      ]
                ),))
                  
                
              
              ],
            ),
            SizedBox(height: width*0.1,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("General mode")),
                ElevatedButton(onPressed: (){}, child: Text("      Next      "))
              ],
            ),
              
              
            
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    // Future.delayed(Duration.zero, () => selectUserMode(context));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
     
      
      home: Scaffold(
        appBar: AppBar(title:Center(
          child: Text(
              'User Mode',
              // textAlign: TextAlign.center,
            )
        ) , backgroundColor: Colors.black87),
        // body: Container()
        // selectUserMode(context),
        body:Container(
          color: Colors.blueGrey.shade900,
          child: selectUserMode(context),
        ),
        
      ),

      // Container(
      //   color: Colors.black87,
      //   width: double.infinity,
      //   height: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         child: const Text(
      //           'Event Planner',
      //           style: TextStyle(fontSize: 25),
      //         ),
      //         onPressed: () {
      //           setUser("Planner");

      //           Navigator.pushNamed(context, '/ImageExplore');
      //         },
      //       ),
      //       ElevatedButton(
      //         child: const Text(
      //           'Normal User',
      //           style: TextStyle(fontSize: 25),
      //         ),
      //         onPressed: () {
      //            setUser("User");
      //           Navigator.pushNamed(context, '/ImageExplore');
      //         },
      //       ),
      //     ],
      //   )
      //   )
    );
  }

  setUser(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userType', userType);
  }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();

// }

// class _SplashScreenState extends State<SplashScreen> {
//   // in this method replace the Navigation() into your class Name And import that file here
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => Navigator()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.green,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.pix, color: Colors.white, size: 100),
//             SizedBox(
//               height: 40.0,
//               child: Text(
//                 "Planners",
//                 style: TextStyle(
//                   fontFamily: 'Arial',
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             CircularProgressIndicator(
//               color: Colors.white,
//             )
//             // CupertinoActivityIndicator(
//             //   radius: 20.0,
//             //   color: Colors.white,
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
}
