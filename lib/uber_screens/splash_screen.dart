import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nable/gloable/gloable.dart';
import 'package:nable/uber_screens/main_screen.dart';

import '../authentication/login_screen_implementation.dart';
import '../authentication/signup_screen.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => MainScreen(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.car_crash,
                size: 60,
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Uber & inDriver Clone App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
