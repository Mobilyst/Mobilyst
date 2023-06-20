import 'package:flutter/material.dart';
import 'package:mobilyst/kategorilerSayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yemek Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YemekKategorileriSayfasi(),
    );
  }
}



