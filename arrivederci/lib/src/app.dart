import 'package:flutter/material.dart';
import 'package:arrivederci/src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Arrivederci",
      theme: ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
