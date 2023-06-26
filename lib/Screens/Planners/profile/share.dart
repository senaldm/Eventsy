import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatelessWidget {
  final data;

  QRCodeGenerator({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
          child: QrImageView(
            data: data,
            version: QrVersions.auto,
            size: 200.0,
            backgroundColor: Colors.green,
          ),
      ),
    );
  }
}
