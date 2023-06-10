import 'package:flutter/material.dart';
import 'package:mobilyst/navigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBarPage(),
      theme: ThemeData(accentColor: Colors.black), // tab bar cizgisinin rengi
    );
  }
}
