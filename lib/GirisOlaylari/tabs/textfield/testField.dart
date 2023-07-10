import 'package:flutter/material.dart';
import 'package:mobilyst/ColorAndType/color.dart';

class MyTextField extends StatelessWidget {
  final controller; //??
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.alti),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}

