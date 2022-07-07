import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nable/gloable/gloable.dart';
import 'package:nable/uber_screens/splash_screen.dart';

class CarInforeScreen extends StatefulWidget {
  CarInforeScreen({Key? key}) : super(key: key);

  @override
  State<CarInforeScreen> createState() => _CarInforeScreenState();
}

class _CarInforeScreenState extends State<CarInforeScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  String? selectedCarType;

  saveCarInfor() {
    Map driverCarInforMap = {
      "car_color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };
    DatabaseReference driverRef =
        FirebaseDatabase.instance.ref().child('drivers');
    driverRef
        .child(currentFirebaseUser!.uid)
        .child("car_details")
        .set(driverCarInforMap);
    Fluttertoast.showToast(
      msg: "Car details has been saved. Congratulations! ",
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => MySplashScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.car_crash,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                'Register as a Driver',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: carModelTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: 'Car Model',
                  hintText: 'Car Model',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: carNumberTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: 'Car Number',
                  hintText: 'Car Number',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: carColorTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: 'Car Color',
                  hintText: 'Car Color',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              DropdownButton<String>(
                value: selectedCarType,
                iconSize: 40,
                dropdownColor: Colors.black,
                hint: const Text(
                  'Please choose Car Type',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                items:
                    <String>["uber-x", "uber-go", "bike"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.lightGreenAccent),
                onPressed: () {
                  if (carColorTextEditingController.text.isNotEmpty &&
                      carModelTextEditingController.text.isNotEmpty &&
                      carNumberTextEditingController.text.isNotEmpty &&
                      selectedCarType != null) {
                    saveCarInfor();
   
                  }
                },
                child: const Text(
                  'Save Now',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
