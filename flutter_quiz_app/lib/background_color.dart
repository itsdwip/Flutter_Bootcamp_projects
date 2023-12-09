import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/home_page.dart';
import 'package:flutter_quiz_app/others/color.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor1,
              backgroundColor2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Home(),
        ),
      ),
    );
  }
}
