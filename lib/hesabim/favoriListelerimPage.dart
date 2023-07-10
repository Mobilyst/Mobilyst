import 'package:flutter/material.dart';
import 'package:mobilyst/ColorAndType/color.dart';

class FavoriListPage extends StatelessWidget {
  const FavoriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favori Listelerim",
          style: TextStyle(
            color: AppColors.bir,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: AppColors.uc,
      ),
    );
  }
}
