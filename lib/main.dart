// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:nable/creens/second_screen.dart';
import 'package:nable/pages/chat_pages.dart';
import 'package:nable/pages/covid_pages.dart';
import 'package:nable/test.dart';

import 'uber_screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MySplashScreen()),
  ));
}

class MyApp extends StatefulWidget {
  final Widget? child;
  const MyApp({this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      child: widget.child!,
      key: key,
    );
  }
}


// class MyApp extends StatefulWidget {
//   final Widget? child;
//   MyApp({this.child});
//   static void restartApp(BuildContext context){
//     context.findAncestorStateOfType()<_MyAppState>()!.restartApp();
//   }

//   @override
//   _MyAppState<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
