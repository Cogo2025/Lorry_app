import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lorry App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(), // Ensure this is the correct page
    );
  }
}
