import 'package:flutter_test/flutter_test.dart';

import 'package:yrzy_hackathon/utils/utils.dart';

void main() {
  group('Settings のテスト', () {    
    test('整数値の値が保存できること', () {
      final expectedValue = 1;

      Settings.instance.setValue(key: SettingsKey.NumberOfQuiz, value: expectedValue);

      final storedValue = Settings.instance.getValue<int>(key: SettingsKey.NumberOfQuiz);
      expect(storedValue, equals(expectedValue));
    });

    test('整数値の値の更新ができること', () {
      final expectedValue = 2;

      Settings.instance.setValue<int>(key: SettingsKey.NumberOfQuiz, value: expectedValue);

      final storedValue = Settings.instance.getValue<int>(key: SettingsKey.NumberOfQuiz);
      expect(storedValue, equals(expectedValue));
    });

    test('すでに保持している値に対して、違う型の値で上書きはできないこと', () {
      final expectedValue = 2;

      Settings.instance.setValue<String>(key: SettingsKey.NumberOfQuiz, value: '1');

      final storedValue = Settings.instance.getValue<int>(key: SettingsKey.NumberOfQuiz);
      expect(storedValue, equals(expectedValue));
    });

    test('削除後は `null` が返されること', () {
      Settings.instance.remove(key: SettingsKey.NumberOfQuiz);

      final storedValue = Settings.instance.getValue<int>(key: SettingsKey.NumberOfQuiz);
      expect(storedValue, isNull);
    });
  });
}