import 'package:flutter/material.dart';

class FavoriListPage extends StatelessWidget {
  const FavoriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favori Listelerim',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
    );
  }
}
