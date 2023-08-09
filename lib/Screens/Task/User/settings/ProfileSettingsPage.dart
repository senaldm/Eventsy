import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';




class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  String name = 'Name';
  String email = 'E Mail';
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
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
        //backgroundColor: Colors.blueGrey.shade900,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              titleSpacing: 2.2,
              forceMaterialTransparency: false,
              backgroundColor:Color.fromARGB(255, 18, 140, 126),
              automaticallyImplyLeading: true,
              centerTitle: true,
              flexibleSpace: Center(
                child: Text('Profile Settings',
                    style: TextStyle(
                        fontSize: width * 0.07,
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
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:   Color.fromARGB(255, 18, 140, 126),
                      
                    ),
                    child: Stack(
                        children: [
                          Container(
                            child: Positioned(
                              bottom: -0.5,
                              right: -0.5,
                                child: Container(
                                  width: 55,
                                  height: 55,   
                                  decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey, width: 2),
                                  color:  const Color.fromARGB(255, 13, 18, 20), // Set the desired blue color here
                                ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.photo_camera,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                    onPressed: _takePhoto,
                                  ),
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                  ),
                ),
                // Small circle
                //SizedBox(height: 20),
                // Change profile picture button
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle the action to change the profile picture
                //     // You can open a dialog, navigate to a new page, or trigger any desired functionality.
                //     // For example, you can use the ImagePicker package to allow the user to select or capture a new profile picture.
                //   },
                //   child: Text('Change Profile Picture'),
                // ),
                Divider(
                  color: Color(0xFF4D4A4A), // Set the color of the line
                  thickness: 1,
                ),
        
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                        color: Color.fromARGB(255, 13, 18, 20), // Set the desired blue color here
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    ), // First icon
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                             padding: const EdgeInsets.only(top: 3, bottom: 3,left: 0,right: 7),  
                            child: Text('Name',style: TextStyle(color: Colors.grey),)),
                            Text(
                              '$name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: width*0.05),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color:  Color.fromARGB(255, 189, 189, 189),
                        size: 30.0,
                      ),
                      onPressed: () {
                        _showEditNameDialog(context);
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF4D4A4A), // Set the color of the line
                  thickness: 1,
                ),
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                        color:  const Color.fromARGB(255, 13, 18, 20), // Set the desired blue color here
                      ),
                      child: Icon(
                        Icons.email_rounded,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ), // First icon
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 3, bottom: 3,left: 0,right: 7),
                              child: Text('E mail',style:TextStyle(color: Colors.grey) ,)),
                            Text(
                              '$email',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: email.length <= 30 ? width*0.05 : width*0.03,
                                color: Colors.white, //fontSize: 22.0
                                // Adjust the font sizes as per your preference
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 189, 189, 189),
                        size: 30.0,
                      ),
                      onPressed: () {
                        _showEditEmailDialog(context);
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF4D4A4A), // Set the color of the line
                  thickness: 1,
                ),
              ],
            ),
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
                      'Done',
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
                      ' Back ',
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

  void _showEditNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:  Color.fromARGB(255, 18, 140, 126), // Set button color to black
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(25), // Set border radius
                  ),
                ),
              onPressed: () {
                String newName = nameController.text;
                setState(() {
                  name = newName;
                });
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showEditEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit E mail'),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'E mail',
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:  Color.fromARGB(255, 18, 140, 126), // Set button color to black
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(25), // Set border radius
                  ),
                ),
              onPressed: () {
                String newEmail = emailController.text;
                setState(() {
                  email = newEmail;
                });
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

   // Function to take a photo using the camera
  // Function to get image from gallery
  Future<void> _getImageFromGallery() async {
    if (await _requestGalleryPermission()) {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } else {
      // Handle no gallery permission
      print('Permission to access gallery not granted.');
    }
  }

  // Function to take a photo using the camera
  Future<void> _takePhoto() async {
    if (await _requestCameraPermission()) {
      final pickedFile = await _picker.getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } else {
      // Handle no camera permission
      print('Permission to access camera not granted.');
    }
  }

  // Function to request gallery permission
  Future<bool> _requestGalleryPermission() async {
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
    }
    return status.isGranted;
  }

  // Function to request camera permission
  Future<bool> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }
}
