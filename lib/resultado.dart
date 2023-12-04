import 'package:flutter/material.dart';

/// Widget para exibir o resultado do quiz.
class Result extends StatelessWidget {
  /// Pontuação obtida no quiz.
  final int resultScore;

  /// Função chamada ao reiniciar o quiz.
  final Function resetHandler;

  /// Construtor para inicializar o widget com a pontuação e a função de reinício.
  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  /// Método para obter a frase de resultado com base na pontuação.
  String get resultPhrase {
    String resultText;
    if (resultScore >= 100) {
      resultText = 'Nota perfeita!';
      print(resultScore);
    } else if (resultScore >= 70) {
      resultText = 'Você está acima da média!';
      print(resultScore);
    } else if (resultScore >= 50) {
      resultText = 'Você está na média!';
    } else if (resultScore >= 10) {
      resultText = 'Você está abaixo da média!';
    } else {
      resultText = 'Estude mais!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Exibe o texto do resultado com estilo e alinhamento específicos.
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // Exibe a pontuação com estilo e alinhamento específicos.
          Text(
            'Pontuação: $resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // Botão para reiniciar o quiz ao pressionar.
          TextButton(
            onPressed: () => resetHandler(),
            child: Container(
              color: Colors.green, // Cor de fundo do botão
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Reiniciar Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
