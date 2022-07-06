// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:nable/model/dummy_data.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_DATA_CATEGORY
              .map((e) => InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (_) {
                      //   return SelectCategoryScreen(
                      //     categoryes: e,
                      //   );
                     // }));
                    },
                    child: Container(
                      child: Center(
                          child: Column(
                        children: [
                          Text(e.id),
                          Text(e.title),
                        ],
                      )),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [e.colors.withOpacity(0.7), e.colors],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
