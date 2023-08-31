import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.didTapStart, {super.key});

  final void Function() didTapStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png',
            width: 250, color: const Color.fromRGBO(255, 255, 255, 0.6)),
        const SizedBox(height: 60),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: didTapStart,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.white,
            ),
            shape: const StadiumBorder(),
          ),
          icon: const Icon(
            Icons.arrow_right_alt, 
            color: Colors.white,
          ),
          label: const Text(
            'Start Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
