import 'package:flutter/material.dart';

class CarInforeScreen extends StatefulWidget {
  CarInforeScreen({Key? key}) : super(key: key);

  @override
  State<CarInforeScreen> createState() => _CarInforeScreenState();
}

class _CarInforeScreenState extends State<CarInforeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Icon(
            Icons.car_crash,
            size: 60,
            color: Colors.white,
          ),
        ],
      )),
    );
  }
}
