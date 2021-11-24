import 'package:flutter/material.dart';
import 'package:flutter_first_app/answer.dart';
import 'package:flutter_first_app/quiz.dart';
import 'package:flutter_first_app/result.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "what's your favorite color?",
      'answers': [
        {'text': 'black', 'score': 2},
        {'text': 'blue', 'score': 5},
        {'text': 'green', 'score': 8},
        {'text': 'red', 'score': 4}
      ]
    },
    {
      'questionText': "what's your favorite food?",
      'answers': [
        {'text': 'sweets', 'score': 8},
        {'text': 'spicy', 'score': 7},
        {'text': 'ice-cream', 'score': 10},
        {'text': 'all', 'score': 5}
      ]
    },
    {
      'questionText': "what's your favorite game?",
      'answers': [
        {'text': 'cs', 'score': 8},
        {'text': 'bs', 'score': 7},
        {'text': 'pd', 'score': 6},
        {'text': 'vr', 'score': 6}
      ]
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
    setState(() {
      _questionIndex += 1;
    });

    print("answer question");
    Fluttertoast.showToast(
        msg: "Question ${_questionIndex} answered",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello MHS"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
