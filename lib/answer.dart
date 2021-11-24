import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        child: ElevatedButton(
          child: Text(
            answerText,
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            selectHandler();
          },
        ),
        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      ),
    );
  }
}
