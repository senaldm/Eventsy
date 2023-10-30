// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// import 'package:barcode_scan_fix/barcode_scan.dart';

// class QrCodeScanner extends StatefulWidget {
//     const QrCodeScanner({super.key});
//   @override
//    State<QrCodeScanner> createState() => _QrCodeScannerState();
// }

// class _QrCodeScannerState extends State<QrCodeScanner> {
//   String qrCodeResult = "Not Yet Scanned";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Scan QR Code"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             //Message displayed over here
//             Text(
//               "Result",
//               style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               qrCodeResult,
//               style: TextStyle(
//                 fontSize: 20.0,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 20.0,
//             ),

//             //Button to scan QR code
//             FlatButton(
//               padding: EdgeInsets.all(15),
//               onPressed: () async {
//                 String codeSanner =
//                     await BarcodeScanner.scan(); //barcode scanner
//                 setState(() {
//                   qrCodeResult = codeSanner;
//                 });
//               },
//               child: Text(
//                 "Open Scanner",
//                 style: TextStyle(color: Colors.indigo[900]),
//               ),
//               //Button having rounded rectangle border
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(color: const Color.fromARGB(255, 53, 56, 83)),
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:mobile_scanner/mobile_scanner.dart';

// class QrCodeScanner extends StatelessWidget {
//  QrCodeScanner({super.key});

//  MobileScannerController cameraController = MobileScannerController();

//  @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(
//   title: const Text('Mobile Scanner'),
//   actions: [
//     IconButton(
//       color: Colors.white,
//       icon: ValueListenableBuilder(
//         valueListenable: cameraController.torchState,
//         builder: (context, state, child) {
//           switch (state as TorchState) {
//             case TorchState.off:
//               return const Icon(Icons.flash_off, color: Colors.grey);
//             case TorchState.on:
//               return const Icon(Icons.flash_on, color: Colors.yellow);
//           }
//         },
//       ),
//       iconSize: 32.0,
//       onPressed: () => cameraController.toggleTorch(),
//     ),
//     IconButton(
//       color: Colors.white,
//       icon: ValueListenableBuilder(
//         valueListenable: cameraController.cameraFacingState,
//         builder: (context, state, child) {
//           switch (state as CameraFacing) {
//             case CameraFacing.front:
//               return const Icon(Icons.camera_front);
//             case CameraFacing.back:
//               return const Icon(Icons.camera_rear);
//           }
//         },
//       ),
//       iconSize: 32.0,
//       onPressed: () => cameraController.switchCamera(),
//     ),
//   ],
// ),
// body: MobileScanner(
//   // fit: BoxFit.contain,
//   controller: cameraController,
//   onDetect: (capture) {
//     final List<Barcode> barcodes = capture.barcodes;
//     final Uint8List? image = capture.image;
//     for (final barcode in barcodes) {
//       debugPrint('Barcode found! ${barcode.rawValue}');
//     }
//   },
// ),
// );
// }

// }
// // import 'package:mobile_scanner/mobile_scanner.dart';

// class _QrCodeScannerState extends State<QrCodeScanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   // Barcode? result;
//   QRViewController? controller;

//   get result => null;

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
// ? Text(
//                       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                   : Text('Scan a code'),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       // setState(() {
//       //   result = scanData;
//       // });
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('qrView'),
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
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
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // if (result != null)
                  //  Navigator.pushNamed(context,'/validateQR');
                  // else
                  //   const Text('Scan a code'),
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
                                }
                                else
                                {
                                 return const Text('Flash: On');
                              }
                              }
                            )),
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
          borderColor: Colors.red,
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
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
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
