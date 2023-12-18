import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizlet/data/questions.dart';
import 'package:quizlet/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalquestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                "You have answered $numCorrectQuestions out of $numTotalquestions questions correctly!",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              label: Text(
                "Restart quiz",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
