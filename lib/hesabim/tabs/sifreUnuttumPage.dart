import 'package:flutter/material.dart';
import 'package:mobilyst/hesabim/textfield/testField.dart';

class MyForgetPasswordPage extends StatefulWidget {
  MyForgetPasswordPage({super.key});

  @override
  State<MyForgetPasswordPage> createState() => _MyForgetPasswordPageState();
}

class _MyForgetPasswordPageState extends State<MyForgetPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
        ],
      ),
    );
  }
}
