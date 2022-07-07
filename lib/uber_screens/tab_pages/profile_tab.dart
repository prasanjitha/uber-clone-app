import 'package:flutter/material.dart';
import 'package:nable/gloable/gloable.dart';

import '../splash_screen.dart';

class profileTab extends StatefulWidget {
  const profileTab({Key? key}) : super(key: key);

  @override
  State<profileTab> createState() => _profileTabState();
}

class _profileTabState extends State<profileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            fAuth.signOut();
             Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => MySplashScreen(),
      ),
    );
          },
          
          child: Text('Sign out')),
      ),
    );
    
  }
}