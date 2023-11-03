import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Content')),
      body: Center(
        child: Text(
          'QR Code Content: $data',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
