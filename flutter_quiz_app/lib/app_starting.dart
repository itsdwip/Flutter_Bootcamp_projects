import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/home_screen.dart';
import 'package:flutter_quiz_app/others/color.dart';
import 'package:flutter_quiz_app/questions_screen.dart';

class AppBackGround extends StatefulWidget {
  const AppBackGround({super.key});

  @override
  State<AppBackGround> createState() => _AppBackGroundState();
}

class _AppBackGroundState extends State<AppBackGround> {
  var activeScreen = 'Home-Screen';
  void setActiveScreen() {
    setState(() {
      activeScreen = 'QuestionsScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(3, -1.9),
              child: Container(
                height: 550,
                width: 600,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: backgroundColor1,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(3, -0.3),
              child: Container(
                height: 300,
                width: 350,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor2,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-3, -0.3),
              child: Container(
                height: 300,
                width: 350,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor2,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: activeScreen == 'Home-Screen'
                  ? Home(setActiveScreen)
                  : const QuestionsScreen(),
            )
          ],
        ),
      ),
    );
  }
}
