import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/app_starting.dart';

class Home extends StatelessWidget {
  const Home(this.activeQuestionsScreen, {super.key});

  final void Function() activeQuestionsScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          height: 300,
          color: const Color.fromARGB(255, 227, 217, 217),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton.icon(
          onPressed: activeQuestionsScreen,
          icon: const Icon(Icons.gps_fixed_outlined),
          label: const Text('Start '),
        )
      ],
    );
  }
}
