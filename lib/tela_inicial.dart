import 'package:flutter/material.dart';
import './main.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Bem Vindo ao Quiz',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context,
                    '/main'); // Use pushReplacementNamed em vez de pushNamed para substituir a tela inicial
              },
              child: Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaQuiz extends StatefulWidget {
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App de Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/', // Defina a rota inicial
      routes: {
        '/': (context) => TelaInicial(), // Rota inicial
        '/main': (context) => TelaQuiz(), // Rota para o quiz
      },
    );
  }
}

void main() {
  runApp(QuizApp());
}
