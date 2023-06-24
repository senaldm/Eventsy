import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      appBar: AppBar(
        //backgroundColor: Colors.green,
        title: const Text(
          "Booking",
          style: TextStyle(
            fontFamily: 'Arial',
            color: Colors.white,
            //fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: const Center(
        child: Text("Booking page"),
      ),
    );
  }
}
