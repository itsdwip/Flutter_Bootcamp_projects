import 'package:dice_app/background_LinearGradient%20.dart';
import 'package:flutter/material.dart';
import '/others/colors.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final randomDiceNumber = Random();
  var diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = randomDiceNumber.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundLinearGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/dice-$diceNumber.png",
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.rocket_launch,
                    color: primaryIconColor1,
                  ),
                  label: const Text(
                    'R O L L',
                    style: TextStyle(
                      color: primaryTextColor1,
                    ),
                  ),
                  onPressed: rollDice,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
