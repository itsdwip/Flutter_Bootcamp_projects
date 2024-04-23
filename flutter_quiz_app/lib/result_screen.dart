import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/app_starting.dart';
import 'package:flutter_quiz_app/others/data/questions_data.dart';
import 'package:flutter_quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionsData[i].text,
        'correct_answer': questionsData[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int numTotalQuestions = questionsData.length;
    final int numOfCorrectlyAns = getSummaryData().where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 113, 74, 218),
              Color.fromARGB(255, 37, 3, 129),
            ],
            begin: Alignment.center,
            end: Alignment.centerRight,
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Answered $numTotalQuestions out of $numOfCorrectlyAns questions correctly',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              QuestionSummary(
                summaryData: getSummaryData(),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppBackGround(),
                    ),
                  );
                },
                icon: const Icon(Icons.refresh),
                label: const Text('try agin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
