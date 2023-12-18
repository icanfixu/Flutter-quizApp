import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: data['correct_answer'] == data['user_answer']
                          ? Color.fromARGB(255, 23, 218, 208)
                          : const Color.fromARGB(255, 228, 110, 102),
                      borderRadius: BorderRadius.circular(18)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 176, 174, 39),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
