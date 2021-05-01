import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ///出題数
  final int numberOfQuizzes;
  ///正解数
  final int numberOfCorrects;

  ResultScreen({
    required this.numberOfQuizzes,
    required this.numberOfCorrects,
  });

  Color _textColor() {
    final percent = this.numberOfCorrects / this.numberOfQuizzes * 100;

    if (percent <= 10.0) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                        'あなたの正解率は…',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${this.numberOfCorrects / this.numberOfQuizzes * 100}％',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: _textColor(),
                        ),
                      ),
                      Text(
                        '${this.numberOfQuizzes}問中${this.numberOfCorrects}問正解でした。',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Text('戻る'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
