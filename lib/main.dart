import 'package:flutter/material.dart';

// Importa os arquivos necessários
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
  // Lista de perguntas e respostas do quiz
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
        {'text': 'Kit de desenvolvimento Android', 'score': 0},
        {'text': 'Kit de desenvolvimento iOS', 'score': 0},
        {'text': 'Kit de desenvolvimento WEB', 'score': 0},
        {'text': 'Todas as opções', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q3. Qual linguagem de programação é usada pelo Flutter',
      'answers': [
        {'text': 'Ruby', 'score': 0},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': 0},
        {'text': 'Kotlin', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q4. Quem criou a linguagem de programação Dart?',
      'answers': [
        {'text': 'Lars Bak e Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 0},
        {'text': 'Jeremy Ashkenas', 'score': 0},
      ],
    },
    {
      'questionText': 'Q5. O que é um widget no Flutter?',
      'answers': [
        {'text': 'Uma função assíncrona', 'score': 0},
        {'text': 'Um componente visual reutilizável', 'score': 10},
        {'text': 'Uma biblioteca para teste de unidade', 'score': 0},
        {
          'text': 'Uma classe para gerenciamento de banco de dados',
          'score': 0,
        },
      ],
    },
    {
      'questionText':
          'Q6. Quais são algumas das vantagens de usar o Flutter para o desenvolvimento de aplicativos móveis?',
      'answers': [
        {
          'text': 'Desenvolvimento rápido de interfaces de usuário',
          'score': 10,
        },
        {'text': 'Criação de aplicativos multiplataforma', 'score': 0},
        {'text': 'Hot reload para atualizações instantâneas', 'score': 0},
        {'text': 'Todas as opções acima', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q7. Qual widget é usado para criar um botão em Flutter?',
      'answers': [
        {'text': 'Text', 'score': 0},
        {'text': 'Container', 'score': 0},
        {'text': 'ElevatedButton', 'score': 10},
        {'text': 'Column', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q8. O que é um Stateful Widget em Flutter?',
      'answers': [
        {'text': 'Um widget que não pode ser atualizado', 'score': 0},
        {
          'text':
              'Um widget que pode ser atualizado com base em alterações de estado',
          'score': 10,
        },
        {'text': 'Um widget usado apenas para exibição de texto', 'score': 0},
        {'text': 'Um widget usado para criar layouts complexos', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q9. Qual é a função principal do widget MaterialApp em Flutter?',
      'answers': [
        {
          'text': 'Configurar o tema do aplicativo e definir as rotas',
          'score': 10,
        },
        {'text': 'Exibir um texto na tela', 'score': 0},
        {'text': 'Criar um botão interativo', 'score': 0},
        {'text': 'Estruturar o layout do aplicativo', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q10. Qual é a função do widget StatefulWidget em Flutter?',
      'answers': [
        {'text': 'Exibir texto na tela', 'score': 0},
        {'text': 'Criar um layout flexível', 'score': 0},
        {'text': 'Definir temas personalizados', 'score': 0},
        {
          'text': 'Permitir que um widget tenha um estado mutável',
          'score': 10,
        },
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  // Método para resetar o quiz
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // Método para responder à pergunta e avançar para a próxima
  void _answerQuestion(int score) {
    _totalScore += score;
    _nextQuestion();
  }

  // Método para avançar para a próxima pergunta ou exibir o resultado
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

// Widget de tela de quiz
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
          widget.questions[widget.questionIndex]['questionText'] as String,
        ),
        // Mapeia as opções de resposta para botões
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
