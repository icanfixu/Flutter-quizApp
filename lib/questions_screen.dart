import 'package:flutter/material.dart';
import 'package:quizlet/answerbutton.dart';
import 'package:quizlet/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    if (currentQuestionIndex < 5) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getshuffledAnswers().map(
              (item) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: AnswerButton(
                    answerText: item,
                    onTap: () {
                      answerQuestion(item);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
