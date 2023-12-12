import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreensState();
}

class _QuestionsScreensState extends State<QuestionsScreen> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              num++;
            });
          },
          child: Text('$num')),
    );
  }
}
