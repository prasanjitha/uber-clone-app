import 'package:flutter/material.dart';

class RatingTab extends StatefulWidget {
  const RatingTab({Key? key}) : super(key: key);

  @override
  State<RatingTab> createState() => _RatingTabState();
}

class _RatingTabState extends State<RatingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Rating'),
      ),
    );
    
  }
}