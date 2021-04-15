import 'package:flutter/material.dart';

import 'package:yrzy_hackathon/widgets/widgets.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('quiz_screen'),
        bottom: PreferredSize(
          child: ProgressBar(
            max: 10, 
            current: _current,
            barColor: Colors.orange,
          ), 
          preferredSize: ProgressBar.preferredSize
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              _current = _current <= 9 
                ? _current + 1 
                : 0;
            });
          }, 
          child: Text('次へ'),
        ),
      ),
    );
  }
}