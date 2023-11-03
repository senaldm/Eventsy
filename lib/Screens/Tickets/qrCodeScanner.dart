// ignore_for_file: override_on_non_overriding_member

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:eventsy/Screens/Tickets/qrCodeValidate.dart';
import 'package:eventsy/Screens/Tickets/secondPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  List<dynamic> data;
  QrCodeScanner({required this.data});

  @override
  State<StatefulWidget> createState() => QrCodeScannerState();
}

class QrCodeScannerState extends State<QrCodeScanner> {
  late List<String> ticketKey;
  late List<dynamic> ticketDetails;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initstate() {
    super.initState();
    ticketKey = widget.data[0]['ticketKey'];
    ticketDetails = widget.data[0];
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid || Platform.isIOS) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // if (result != null)
                  // {

                  // }else{
                  //    Text('Scan a code'),},
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == true) {
                                    return const Text('Flash Off}');
                                  } else {
                                    return const Text('Flash: On');
                                  }
                                })),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 450.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    // final future = Completer<void>();
    controller.scannedDataStream.listen((scanData) {
      // setState(() {
      //   result = scanData;
      // });
      if (scanData != null) {
        print(ticketDetails);
         //Navigator.pushNamed(
         // context, '/qrCodeValidate',
         // arguments: [scanData.code, ticketDetails]
        //);
      //  Navigator.pushNamed(context,'/qrCodeValidate',arguments:scanData.code);
   //      Navigator.of(context).push(MaterialPageRoute(
    //    builder: (context) => SecondPage(data: scanData.code??''),
    //  ));
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TicketValidationScreen(
              scannedQRCode: scanData.code??'', // Replace with your first data
              ticketDetails: ticketDetails, // Replace with your second data
            ),
          ),
        );
//       Navigator.of(context).push(MaterialPageRoute(
//   builder: (context) => TicketValidationScreen((scanData.code, ticketDetails)),
// ));
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => TicketValidationScreen(
        //     scannedQRCode: scanData.code??'',
        //     ticketDetails: ticketDetails,
        //   ),
        // ));

        //   String matchingKey = '';
        //   for (String key in ticketKey) {
        //     if (scanData.code == key) {
        //       matchingKey = key;
        //       break;
        //     }
        //     // break;
        //   }

        // if (matchingKey!='') {
        //   print(ticketDetails);

        //   Navigator.pushNamed(context, '/qrCodeValidate',
        //       //arguments: [true, ticketDetails]
        //       );

        // }
        // else{
        //   Navigator.pushNamed(context, '/qrCodeValidate',
        //       //arguments: [false, ticketDetails]
        //       );

        // }

        // Check if a QR code is detected
        // If a QR code is detected, navigate to another page
     //   Navigator.pushNamed(context,'/qrCodeValidate');
     
      }
    });

    // print(ticketDetails);
    // controller.scannedDataStream.listen((scanData) {
    // Navigator.pushNamed(context, '/validateQR',
    //     arguments: [false, ticketDetails]);

    // if (scanData != null) {
    //   String matchingKey = '';
    //   for (String key in ticketKey) {
    //     if (scanData.code == key) {
    //       matchingKey = key;
    //       break;
    //     }
    //     // break;
    //   }

    // if (matchingKey == '') {
    //   print(ticketDetails);

    //   Navigator.pushNamed(context, '/validateQR',
    //       arguments: [false, ticketDetails]);

    // }
    // else{
    //   Navigator.pushNamed(context, '/validateQR',
    //       arguments: [true, ticketDetails]);

    // }
    //  if (matchingKey == '' && !controller.scannedDataStream.hasListeners<void>()) {
    //   future.complete();
    // }

    // Wait for the Future to resolve before calling Navigator.pushNamed().
    // Future.delayed(Duration(milliseconds: 100)).then((_) {
    // If the key matches, navigate to the /validateQR route with the matching ticket details.
    // if (matchingKey.isNotEmpty) {
    //   Navigator.pushNamed(context, '/validateQR',
    //       arguments: [true, ticketDetails]);
    // } else {
    //   // If the key does not match, navigate to the /validateQR route with the original ticket details.
    //   Navigator.pushNamed(context, '/validateQR',
    //       arguments: [false, ticketDetails]);
    // }
    // });
    // }
    // });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


















// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// // void main() => runApp(const MaterialApp(home: MyHome()));

// // class MyHome extends StatelessWidget {
// //   const MyHome({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Flutter Demo Home Page')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.of(context).push(MaterialPageRoute(
// //               builder: (context) => const QrCodeScanner(),
// //             ));
// //           },
// //           child: const Text('qrView'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class QrCodeScanner extends StatefulWidget {
// List<dynamic> data;
//    QrCodeScanner({required this.data});

//   @override
//   State<StatefulWidget> createState() => _QrCodeScannerState();
// }

// class _QrCodeScannerState extends State<QrCodeScanner> {
//   // Barcode? result;
//   // QRViewController? controller;
//   // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//     late List<String> ticketKey;
//   late List<dynamic> ticketDetails;
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void initstate() {
//     super.initState();
//     ticketKey = widget.data[0]['ticketKey'];
//     ticketDetails = widget.data[0];
//   }

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(flex: 4, child: _buildQrView(context)),
//           Expanded(
//             flex: 1,
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   if (result != null)
//                     Text(
//                         'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                   else
//                     const Text('Scan a code'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               await controller?.toggleFlash();
//                               setState(() {});
//                             },
//                             child: FutureBuilder(
//                               future: controller?.getFlashStatus(),
//                               builder: (context, snapshot) {
//                                 return Text('Flash: ${snapshot.data}');
//                               },
//                             )),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               await controller?.flipCamera();
//                               setState(() {});
//                             },
//                             child: FutureBuilder(
//                               future: controller?.getCameraInfo(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.data != null) {
//                                   return Text(
//                                       'Camera facing ${describeEnum(snapshot.data!)}');
//                                 } else {
//                                   return const Text('loading');
//                                 }
//                               },
//                             )),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.pauseCamera();
//                           },
//                           child: const Text('pause',
//                               style: TextStyle(fontSize: 20)),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.resumeCamera();
//                           },
//                           child: const Text('resume',
//                               style: TextStyle(fontSize: 20)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
