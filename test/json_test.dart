import 'package:flutter_test/flutter_test.dart';

import 'package:yrzy_hackathon/utils/utils.dart';

void main() {
  // NOTE: Assets からの読み込みのため.
  TestWidgetsFlutterBinding.ensureInitialized();

  group('JSON のテスト', () {
    test('フォーマットが正しいことをサンプルで検知できること', () {
      Json.load(JsonFile.Sample).then((jsonString) {
        expect(Json.checkFormat(jsonString), true);
      });
    });

    // TODO: クイズの JSON が追加されたらテストを追加する
  });
}