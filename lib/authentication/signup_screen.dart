// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nable/authentication/car_infore_screen.dart';
import 'package:nable/authentication/login_screen_implementation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nable/gloable/gloable.dart';

import '../widgets/progress_dialog.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: 'Name must be at least 3 charactors.');
    } else if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: 'Email is not valid.');
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Phone number is required.');
    } else if (passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(msg: 'Password must be at least 6 charactores.');
    } else {
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(message: 'Prossecing, Please wait...');
      },
    );
    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "Error: " + msg.toString(),
      );
    }))
        .user;
    if (firebaseUser != null) {
      Map driverMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      DatabaseReference driverRef =
          FirebaseDatabase.instance.ref().child('drivers');
      driverRef.child(firebaseUser.uid).set(driverMap);

      currentFirebaseUser = firebaseUser;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => CarInforeScreen(),
        ),
      );
      Fluttertoast.showToast(
        msg: "Account has been created! ",
      );

    } else {
      Fluttertoast.showToast(
        msg: "Account has not been created! ",
      );
    }
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
                    Icons.login,
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
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
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
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Phone',
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
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
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
                  controller: passwordTextEditingController,
                  style: const TextStyle(color: Colors.grey),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreenAccent),
                  onPressed: () {
                    validateForm();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (c) => CarInforeScreen(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Already Have an Account? Login Here',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
