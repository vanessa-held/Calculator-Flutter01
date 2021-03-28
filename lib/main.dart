import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/calculator_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.amber,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new CalculatorPage(),
        title: new Text(
          'Bem vindo',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
        ),
        backgroundColor: Colors.deepOrange,
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.black);
  }
}
