enum SettingsKey {
  /// クイズの問題数
  NumberOfQuiz
}

/// アプリに関する設定を管理するシングルトンクラス.
class Settings {

  /// インスタンス保持用のプライベートな変数.
  static Settings? _instance;

  static Settings get instance {
    final internal = _instance;
    if (internal != null) {
      return internal;
    }

    final newInstance = Settings._();
    _instance = newInstance;

    return newInstance;
  }

  Map<String, dynamic> _keyValue = {};

  // NOTE: 名前付きコンストラクタをプライベートにして、コンストラクタをプライベートでのみ利用できるようにしている.
  // こうすることで上記の `instance` からのみインスタンスを取得するように強制することができる.
  Settings._();

  /// `Enum` から `String` に変換するメソッド.
  String _mapKeyToString(SettingsKey key) {
    switch (key) {
      case SettingsKey.NumberOfQuiz:
        return 'number_of_quiz';
    }
  }

  void setValue({
    required SettingsKey key, 
    required dynamic value
  }) {
    final keyString = _mapKeyToString(key);
    _keyValue.update(keyString, (_) => value);
  }

  T? getValue<T>({
    required SettingsKey key,
  }) {
    final keyString = _mapKeyToString(key);
    if (!_keyValue.containsKey(keyString)) {
      return null;
    }

    final value = _keyValue[keyString];
    return value is T 
      ? value 
      : null;
  }
}