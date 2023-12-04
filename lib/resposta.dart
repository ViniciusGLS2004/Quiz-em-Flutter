import 'package:flutter/material.dart';

/// Widget para exibir uma opção de resposta em um quiz.
class Answer extends StatelessWidget {
  /// Função chamada ao selecionar a resposta.
  final Function selectHandler;

  /// Texto da resposta.
  final String answerText;

  /// Construtor para inicializar o widget com a função de seleção e texto da resposta.
  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => selectHandler(),
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Cor de fundo do botão
          onPrimary: Colors.white, // Cor do texto no botão
        ),
        child: Text(answerText), // Texto exibido no botão
      ),
    );
  }
}
