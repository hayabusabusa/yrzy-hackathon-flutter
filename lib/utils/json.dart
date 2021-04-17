import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// `/json` に配置した JSON の種類を表す Enum.
/// 
/// 新規に JSON を `/json` に追加したい場合は、JSON を配置した後にこの Enum に新しい値を追加する.
enum JsonFile {
  /// `/json/sample.json` の JSON ファイル.
  Sample,
  Quiz,
}

class Json {
  /// `/json` 以下に配置した JSON ファイルを読み込んで内容を `String` で返す.
  /// 
  /// 引数 [file] には Enum で定義された `JsonFile` を指定する.
  /// 
  /// 使用例 :
  /// 
  /// ```dart
  /// final jsonString = await Json.load(JsonFile.Sample);
  /// ```
  static Future<String> load(JsonFile file) async {
    return rootBundle.loadString(_fileName(file));
  }

  /// 文字列になった JSON のフォーマットをチェックする.
  /// 
  /// このメソッドは基本的にテストで使用する.
  static bool checkFormat(String jsonString) {
    try {
      final output = jsonDecode(jsonString);
      return output != null;
    } catch (_) {
      // NOTE: エラー発生時はデコードに失敗している、つまりフォーマットが間違っているため `false` を返す.
      return false;
    }
  }

  /// JSON のファイルがあるパスを返すプライベート関数.
  /// 
  /// `JsonFile` の Enum からファイルのパスに変換してあげる.
  static String _fileName(JsonFile file) {
    switch (file) {
      case JsonFile.Sample:
        return 'json/sample.json';
      case JsonFile.Quiz:
        return 'json/quiz.json';
    }
  }
}