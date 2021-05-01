class SettingsManager {

  /// インスタンス保持用のプライベートな変数.
  static SettingsManager? _instance;

  static SettingsManager get instance {
    final internal = _instance;
    if (internal != null) {
      return internal;
    }

    final newInstance = SettingsManager._();
    _instance = newInstance;

    return newInstance;
  }

  // NOTE: 名前付きコンストラクタをプライベートにして、コンストラクタをプライベートでのみ利用できるようにしている.
  // こうすることで上記の `instance` からのみインスタンスを取得するように強制することができる.
  SettingsManager._();
}