import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.didTapRetry,
  });
  final List<String> chosenAnswers;
  final void Function() didTapRetry;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "questions_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "selected_answer": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numberOfQuestionsAnsweredCorrectly = summary
        .where((element) =>
            element["correct_answer"] == element["selected_answer"])
        .toList()
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numberOfQuestionsAnsweredCorrectly of ${questions.length} questions correctly!!",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summary),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: didTapRetry,
                icon: const Icon(
                  Icons.replay_sharp,
                  color: Colors.white,
                ),
                label: const Text(
                  "Restart Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
