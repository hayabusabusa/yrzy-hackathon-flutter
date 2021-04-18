import 'package:flutter/material.dart';

class AppTheme {
  /// アプリのライトモードのテーマ
  static final light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      // AppBar の背景色
      color: Colors.white,
      shadowColor: Colors.black38,
      // AppBar のタイトルのフォント設定
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      // AppBar のアイコンの色
      iconTheme: IconThemeData(
        color: Colors.grey.shade600,
      ),
      // AppBar のアクションに設定したアイコンの色
      actionsIconTheme: IconThemeData(
        color: Colors.grey.shade600,
      ),
    ),
  );

  /// アプリのダークモードのテーマ
  static final dark = ThemeData.dark();
}