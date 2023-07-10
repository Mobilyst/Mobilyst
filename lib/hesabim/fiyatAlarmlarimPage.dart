import 'package:flutter/material.dart';
import 'package:mobilyst/ColorAndType/color.dart';

class FiyatAlarmPage extends StatelessWidget {
  const FiyatAlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fiyat Alarmlarım",
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
