import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((item) {
            String correctAnswer = item['correct_answer'] as String;
            String selectedAnswer = item['selected_answer'] as String;
            final didSelectCorrectAnswer = correctAnswer == selectedAnswer;
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    decoration: BoxDecoration(
                      color: didSelectCorrectAnswer ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((item['questions_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          if (!didSelectCorrectAnswer)
                            Text(
                              selectedAnswer,
                              style: const TextStyle(
                                color: Color(0xFFFF6A6A),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          Text(
                            correctAnswer,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 90, 255, 95),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
