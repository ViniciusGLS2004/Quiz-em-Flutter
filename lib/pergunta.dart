import 'package:flutter/material.dart';

/// Um widget reutilizável para exibir perguntas em um quiz.
class Question extends StatelessWidget {
  /// Texto da pergunta a ser exibido.
  final String questionText;

  /// Construtor para inicializar a pergunta com o texto fornecido.
  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retorna um contêiner que exibe o texto da pergunta centralizado.
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
