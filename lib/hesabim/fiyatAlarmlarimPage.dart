import 'package:flutter/material.dart';

class FiyatAlarmPage extends StatelessWidget {
  const FiyatAlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fiyat Alarmlarım',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
    );
  }
}
