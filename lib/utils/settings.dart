/// 設定として管理する項目を表すキーの一覧
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

  /// 指定したキーに対応する値をセットする.
  void setValue<T>({
    required SettingsKey key, 
    required T value
  }) {
    final keyString = _mapKeyToString(key);

    // NOTE: 初回の場合は Map に追加して終了.
    if (!_keyValue.containsKey(keyString)) {
      _keyValue.addEntries([MapEntry(keyString, value)]);
      return;
    }

    // NOTE: 念のため型のチェックをして、違うなら何もしない.
    final storedValue = _keyValue[keyString];
    if (!storedValue is T) {
      return;
    }

    _keyValue.update(keyString, (_) => value);
  }
 
 /// 指定したキーに対応する値を取り出す.
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

  /// 指定したキーと値を削除する.
  void remove({
    required SettingsKey key
  }) {
    final keyString = _mapKeyToString(key);
    _keyValue.remove(keyString);
  }
}