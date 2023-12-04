import 'package:flutter/material.dart';

import './resposta.dart';
import './pergunta.dart';

/// Widget para exibir um conjunto de perguntas e respostas em um quiz.
class Quiz extends StatelessWidget {
  /// Lista de perguntas e respostas.
  final List<Map<String, dynamic>> questions;

  /// Índice da pergunta atual.
  final int questionIndex;

  /// Função chamada ao responder a uma pergunta.
  final Function answerQuestion;

  /// Construtor para inicializar o widget com as perguntas, índice e função de resposta.
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
        // Exibe a pergunta atual usando o widget Question.
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        SizedBox(height: 16), // Espaçamento entre pergunta e respostas.
        // Mapeia as respostas para o widget Answer.
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
