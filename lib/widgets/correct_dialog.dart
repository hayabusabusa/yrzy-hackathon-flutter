import 'package:flutter/material.dart';

class CorrectDialog extends StatefulWidget {
  /// 正解か不正解かを表す論理値.
  final bool isCorrect;
  /// ダイアログを表示しておく時間.
  final Duration duration;
  /// ダイアログに表示する画像のサイズ.
  final Size imageSize;

  CorrectDialog({
    required this.isCorrect,
    required this.duration,
    required this.imageSize,
  });

  /// 正解、不正解のエフェクトの Widget を表示する.
  /// `BuildContext` は必須で、正解か不正解かの論理値を `isCorrect` にセットする.
  /// `duration` は任意でエフェクトを表示する時間を指定できる.
  static Future<void> show({
    required BuildContext context,
    required bool isCorrect,
    Duration? duration,
  }) {
    return showDialog(
      context: context, 
      builder: (_) => CorrectDialog(
        isCorrect: isCorrect,
        duration: duration ?? Duration(milliseconds: 500), 
        imageSize: Size(128, 128),
      ),
      barrierDismissible: false,
      barrierColor: Colors.transparent,
    );
  }

  @override
  _CorrectDialogState createState() => _CorrectDialogState();
}

class _CorrectDialogState extends State<CorrectDialog> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) { 
      Future.delayed(widget.duration).then((value) {
        Navigator.of(context).pop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Image.asset(
        widget.isCorrect ? 'assets/correct_circel.png' : 'assets/incorrect_cross.png',
        width: widget.imageSize.width,
        height: widget.imageSize.height,
      ),
    );
  }
}