import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    // text ekledigimizde widgeta kendimiz bir ozellik eklemis oluyorz
    // ve bunla butonlara farkli sekilde seyler uydurabiliyoruz!!
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // hareket algilayici
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 3, 14, 137),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
