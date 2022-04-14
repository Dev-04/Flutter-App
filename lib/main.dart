import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sarena/services/intercon.dart';
import 'colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screens/redirect.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(OverlaySupport.global(
    child: MaterialApp(
      home: Redirect(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class loadHome extends StatefulWidget {
  const loadHome({Key? key}) : super(key: key);

  @override
  _loadHomeState createState() => _loadHomeState();
}

void initState() {
  InternetConnectionChecker().onStatusChange.listen((status) {
    final connected = status == InternetConnectionStatus.connected;
    showSimpleNotification(
        Text(connected ? "Connected to internet" : "No internet"), background: Colors.green);
  });
}

class _loadHomeState extends State<loadHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Image.asset(
                "assets/images/logo.jpeg",
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 20,
              ),
              SpinKitThreeBounce(
                color: loadColor,
                size: 50.0,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
