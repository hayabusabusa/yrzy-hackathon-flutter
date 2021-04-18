import 'package:flutter/material.dart';

import 'package:yrzy_hackathon/widgets/widgets.dart';
// import 'package:yrzy_hackathon/utils/utils.dart';

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
        title: Text('問題'),
        bottom: PreferredSize(
            child: ProgressBar(
              max: 10,
              current: _current,
              barColor: Colors.orange,
            ),
            preferredSize: ProgressBar.preferredSize),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '第1問 雑学',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '4月3日は、「いんげん豆の日」だそうです。「いんげん」という名前の由来となったのは、次のうちどれでしょう？',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
              ],
            ),
            Expanded(
              child: SizedBox()
            ),
            OutlinedButton(
              onPressed: (){
                setState(() {
                _current = _current <= 9 ? _current + 1 : 0;
                });
              },
              child: Text('国の名前'),
            ),
            OutlinedButton(
              onPressed: (){
                setState(() {
                _current = _current <= 9 ? _current + 1 : 0;
                });
              },
              child: Text('人の名前'),
            ),
            OutlinedButton(
              onPressed: (){
                setState(() {
                _current = _current <= 9 ? _current + 1 : 0;
                });
              },
              child: Text('漢詩の一部'),
            ),
          ]
        ),
      ),
    );
  }
}
