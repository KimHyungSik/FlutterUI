import 'package:flutter/material.dart';
import 'package:ui_tutorial/Screen/Login/components/background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(),
    );
  }
}
