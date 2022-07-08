import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Add data to firestore'),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
                onPressed: () async {
                  CollectionReference users = firestore.collection('myusers');
                  await users.add({
                    "name": 'kamal',
                    "address": 'matara'
                  }); // auto generate id
                  // await users.doc('flutter_12').set({
                  //   "name": 'kamal', "address": 'matara'
                  // });
                },
                child: Text('Add Data')),
            ElevatedButton(
                onPressed: () async {
                  CollectionReference users = firestore.collection('myusers');
                  QuerySnapshot allresults = await users.get();
                  allresults.docs.forEach((DocumentSnapshot element) {
                    print(element);
                  });
                },
                child: Text('Read Data firestore'))
          ],
        ),
      ),
    );
  }
}
