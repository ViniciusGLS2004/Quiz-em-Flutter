import 'package:flutter/material.dart';

import './resposta.dart';
import './pergunta.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        SizedBox(height: 16),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Answer(
              () => answerQuestion(answer['score'] as int),
              answer['text'] as String,
            ),
          );
        }).toList(),
      ],
    );
  }
}
