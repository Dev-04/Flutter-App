import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarena/colors.dart';
import 'package:sarena/widgets/back.dart';

class acadLib extends StatefulWidget {
  const acadLib({ Key? key }) : super(key: key);

  @override
  _acadLibState createState() => _acadLibState();
}

class _acadLibState extends State<acadLib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: back(),
    );
  }
}