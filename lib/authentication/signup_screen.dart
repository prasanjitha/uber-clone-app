import 'package:flutter/material.dart';
import 'package:nable/authentication/car_infore_screen.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => CarInforeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
