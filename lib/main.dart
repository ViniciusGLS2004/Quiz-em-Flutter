import 'package:flutter/material.dart';

import './quiz.dart';
import './resultado.dart';
import 'tela_inicial.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Quem criou o Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Adobe', 'score': 0},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': 0},
      ],
    },
    {
      'questionText': 'Q2. O que é Flutter?',
      'answers': [
        {'text': 'Kit de desemvolvimento Android', 'score': 0},
        {'text': 'Kit de desemvolvimento iOS', 'score': 0},
        {'text': 'Kit de desemvolvimento WEB', 'score': 0},
        {'text': 'Todas as opções', 'score': 10},
      ],
    },
    {
      'questionText': 'Q3. Qual linguagem de programação é usada pelo Flutter',
      'answers': [
        {'text': 'Ruby', 'score': 0},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': 0},
        {'text': 'Kotlin', 'score': 0},
      ],
    },
    {
      'questionText': 'Q4. Quem criou a linguagem de programação Dart?',
      'answers': [
        {'text': 'Lars Bak e Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 0},
        {'text': 'Jeremy Ashkenas', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('Nós temos muitas questões!');
    } else {
      print('Não temos mais questões!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Programa Quiz em DS'),
          backgroundColor: const Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}

class QuizScreen extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  QuizScreen({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  State<QuizScreen> createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.questions[widget.questionIndex]['questionText'],
        ),
        ...(widget.questions[widget.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return ElevatedButton(
            onPressed: () => widget.answerQuestion(answer['score'] as int),
            child: Text(answer['text'] as String),
          );
        }).toList(),
      ],
    );
  }
}
