import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lorry App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(), // Ensure this is the correct page
    );
  }
}