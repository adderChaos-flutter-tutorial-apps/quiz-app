import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  late Widget activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void retryQuiz() {
    selectedAnswers = [];
    activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    setState(() {});
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
            chosenAnswers: selectedAnswers, didTapRetry: retryQuiz);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 113, 31, 255),
                  Color.fromARGB(255, 114, 78, 177)
                ],
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
              ),
            ),
            child: Center(child: activeScreen)),
      ),
    );
  }
}
