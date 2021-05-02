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

  // NOTE: 名前付きコンストラクタをプライベートにして、コンストラクタをプライベートでのみ利用できるようにしている.
  // こうすることで上記の `instance` からのみインスタンスを取得するように強制することができる.
  Settings._();
}