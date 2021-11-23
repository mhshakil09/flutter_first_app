import 'package:flutter/material.dart';
import 'package:flutter_first_app/answer.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
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
    var questions = [
      {
        'questionText': "what's your favorite color?",
        'answers': ['black', 'blue', 'green', 'red']
      },
      {
        'questionText': "what's your favorite food?",
        'answers': ['sweets', 'spicy', 'ice-cream', 'all']
      },
      {
        'questionText': "what's your favorite game?",
        'answers': ['cs', 'bs', 'pd', 'vr']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello MHS"),
        ),
        body: Column(
          children: [
            // Text(questions[_questionIndex]),
            Question(
              questions[_questionIndex]['questionText'].toString(),
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion ,answer)).toList()
          ],
        ),
      ),
    );
  }
}
