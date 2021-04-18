import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:yrzy_hackathon/entities/sample.dart';
import 'package:yrzy_hackathon/entities/entities.dart';
import 'package:yrzy_hackathon/utils/utils.dart';

void main() {
  // NOTE: Assets からの読み込みのため.
  TestWidgetsFlutterBinding.ensureInitialized();

  group('サンプルの JSON のテスト', () {
    test('フォーマットが正しいことをサンプルで検知できること', () {
      Json.load(JsonFile.Sample).then((jsonString) {
        expect(Json.checkFormat(jsonString), true);
      });
    });

    test('サンプルのJSONでデコードができることを確認', () {
      Json.load(JsonFile.Sample).then((jsonString) {
        final json = jsonDecode(jsonString);
        final sample = Sample.fromJson(json);
        final firstElement = sample.array[0];

        expect(sample.array.length, 2);
        expect(firstElement.integer, 0);
        expect(firstElement.string, 'text');
        expect(firstElement.boolean, true);
        expect(firstElement.strings.length, 3);
        expect(firstElement.strings, ['text1', 'text2', 'text3']);
      });
    });
  });

  group('クイズの JSON のテスト', () {
    test('フォーマットが正しいことを確認', () {
      Json.load(JsonFile.Quiz).then((jsonString) {
        expect(Json.checkFormat(jsonString), true);
      });
    });

    test('モデルクラスにデコードできることを確認', () {
      Json.load(JsonFile.Quiz).then((jsonString) {
        final json = jsonDecode(jsonString);
        final List<dynamic> quizzesJson = json['quizzes'];
        final quizzes = quizzesJson.map((e) => Quiz.fromJson(e)).toList();
        final quiz = quizzes.first;

        expect(quiz.question, '4月3日は、「いんげん豆の日」だそうです。「いんげん」という名前の由来となったのは、次のうちどれでしょう？');
        expect(quiz.genre, '雑学');
        expect(quiz.difficulty, 2);
        expect(quiz.answer, '人の名前');
        expect(quiz.choices.length, 3);
        expect(quiz.choices.first, '国の名前');
      });
    });
  });
}