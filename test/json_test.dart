import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:yrzy_hackathon/entities/entities.dart';
import 'package:yrzy_hackathon/utils/utils.dart';

void main() {
  // NOTE: Assets からの読み込みのため.
  TestWidgetsFlutterBinding.ensureInitialized();
  group('クイズの JSON のテスト', () {
    test('フォーマットが正しいことを確認', () async {
      final jsonString = await Json.load(JsonFile.Quiz);
      expect(Json.checkFormat(jsonString), equals(true));
    });

    test('モデルクラスにデコードできることを確認', () async {
      final jsonString = await Json.load(JsonFile.Quiz);
      final json = jsonDecode(jsonString);
      final List<dynamic> quizzesJson = json['quizzes'];
      final quizzes = quizzesJson.map((e) => Quiz.fromJson(e)).toList();
      final quiz = quizzes.first;

      expect(quiz.question, equals('4月3日は、「いんげん豆の日」だそうです。「いんげん」という名前の由来となったのは、次のうちどれでしょう？'));
      expect(quiz.genre, equals('雑学'));
      expect(quiz.difficulty, equals(2));
      expect(quiz.answer, equals('人の名前'));
      expect(quiz.choices, equals(['国の名前', '人の名前', '漢詩の一部']));
    });
  });
}