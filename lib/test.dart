import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestEidgets extends StatelessWidget {
  const TestEidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            CupertinoTextField(placeholder: 'enter name',maxLength: 20,
            suffix: Icon(Icons.search),)
          ],
        ),
      ),
    );
  }
}