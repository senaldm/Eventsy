import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// import 'package:barcode_scan_fix/barcode_scan.dart';

class QrCodeScanner extends StatefulWidget {
    const QrCodeScanner({super.key});
  @override
   State<QrCodeScanner> createState() => _QrCodeScannerState();
}

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








class _QrCodeScannerState extends State<QrCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  QRViewController? controller;
  
  get result => null;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // setState(() {
      //   result = scanData;
      // });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
