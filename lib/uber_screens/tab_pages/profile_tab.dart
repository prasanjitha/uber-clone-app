import 'package:flutter/material.dart';

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
        child: Text('Profile'),
      ),
    );
    
  }
}