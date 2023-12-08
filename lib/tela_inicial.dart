import 'package:flutter/material.dart';
import './main.dart';

/// Widget para a tela inicial do aplicativo.
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
            Image.asset(
              'assets/images/flutter.jpg',
            ),
            SizedBox(height: 20),
            Text(
              'Bem Vindo ao Quiz',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Use pushReplacementNamed em vez de pushNamed para substituir a tela inicial
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Adicionando o Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Widget para a tela do quiz.
class TelaQuiz extends StatefulWidget {
  @override
  QuizScreenState createState() => QuizScreenState();
}

/// Widget principal do aplicativo.
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
