import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:yrzy_hackathon/screens/screens.dart';
import 'package:yrzy_hackathon/widgets/widgets.dart';
import 'package:yrzy_hackathon/utils/utils.dart';
import 'package:yrzy_hackathon/entities/entities.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _numberOfCorrects = 0;
  List<Quiz> _quizzes = [];

  Widget _buildRowStars() {
    final difficulty = _quizzes.isEmpty ? 0 : _quizzes[_currentIndex].difficulty;
    final boolList = List<bool>.generate(5, (index) => index < difficulty);
    return Row(
      children: boolList.map((isFilled) {
        return isFilled
          ? Icon(
              Icons.star_rounded, 
              color: Colors.yellow,
            )
          : Icon(
              Icons.star_rounded, 
              color: Colors.grey,
            );
      }).toList(),
    );
  }

  Widget _buildColumnButtons() {
    final List<String> choices = _quizzes.isEmpty ? [] : _quizzes[_currentIndex].choices;

    // NOET: クイズの選択肢の順番をシャッフルする
    choices.shuffle();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: choices.map((choice) {
        return OutlinedButton(
          onPressed: () async {
            final answer = _quizzes.isEmpty ? '' : _quizzes[_currentIndex].answer;
            final isCorrect = answer == choice;
            
            // NOTE: 正解か不正解かのエフェクトを表示して、自動で非表示になるまで await で待機する.
            await CorrectDialog.show(context: context, isCorrect: isCorrect);

            setState(() {
              _numberOfCorrects = isCorrect ? _numberOfCorrects + 1 : _numberOfCorrects;
              _currentIndex = _currentIndex < _quizzes.length ? _currentIndex + 1 : _currentIndex;
            });

            if (_currentIndex == _quizzes.length) {
              Navigator.of(context).push(
                FadeRoute(
                  ResultScreen(
                    numberOfQuizzes: _quizzes.length,
                    numberOfCorrects: _numberOfCorrects
                  )
                )
              );
              _currentIndex = _currentIndex - 1;
            }
          },
          child: Text(choice),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();

    Json.load(JsonFile.Quiz).then((jsonString) {
      final json = jsonDecode(jsonString);
      final List<dynamic> quizzesJson = json['quizzes'];

      // NOTE: クイズの順番をシャッフルする.
      quizzesJson.shuffle();

      setState(() {
        _quizzes = quizzesJson.map((e) => Quiz.fromJson(e)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('問題'),
        bottom: PreferredSize(
          child: ProgressBar(
            max: _quizzes.isEmpty ? 1 : _quizzes.length,
            current: _quizzes.isEmpty ? 0 : _currentIndex + 1,
            textColor: Theme.of(context).textTheme.caption?.color ?? Colors.black,
            backgroundColor: Theme.of(context).dividerColor,
          ),
          preferredSize: ProgressBar.preferredSize,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            Text(
              '第${_currentIndex + 1}問 ${_quizzes.isEmpty ? '' : _quizzes[_currentIndex].genre}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12,),
            Text(
              _quizzes.isEmpty ? '読み込み中' : _quizzes[_currentIndex].question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12,),
            _buildRowStars(),
            const Expanded(
              child: const SizedBox(),
            ),
            _buildColumnButtons(),
          ],
        ),
      ),
    );
  }
}
