import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/others/components/answer_button_style.dart';
import 'package:flutter_quiz_app/others/data/questions_data.dart';
import 'package:flutter_quiz_app/result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreensState();
}

class _QuestionsScreensState extends State<QuestionsScreen> {
  List<String> selectedAnswers = [];
  int currentQuestionIndex = 0;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  void answerQuestion(String selectedAnswers) {
    setState(
      () {
        currentQuestionIndex == questionsData.length - 1
            ? changeToResultScreen()
            : currentQuestionIndex++;
      },
    );
  }

  void changeToResultScreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            chosenAnswers: selectedAnswers,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var currantquestion = questionsData[currentQuestionIndex];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currantquestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                wordSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currantquestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    setState(
                      () {
                        chooseAnswer(answer);
                        answerQuestion(answer);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
