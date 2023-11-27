import 'package:flutter/material.dart';

import './resposta.dart';
import './pergunta.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
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
          questions[questionIndex]['questionText'].toString(),
        ),
        SizedBox(height: 16), // Defina a altura desejada entre as alternativas
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8), // Defina o espaçamento vertical desejado
            child: Answer(
              () => answerQuestion(answer['score'] as int),
              answer['text'].toString(),
            ),
          );
        }).toList(),
      ],
    );
  }
}
