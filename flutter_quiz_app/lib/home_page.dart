import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          onPressed: () {},
          icon: const Icon(Icons.gps_fixed_outlined),
          label: const Text('Start '),
        )
      ],
    );
  }
}
