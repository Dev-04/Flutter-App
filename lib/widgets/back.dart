import 'package:flutter/material.dart';
import 'package:sarena/screens/acadHome.dart';

class back extends StatelessWidget {
  const back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        runApp(MaterialApp(
          home: acadhome(),
          debugShowCheckedModeBanner: false,
        ));
      },
      icon: Icon(Icons.arrow_back),
    );
  }
}
