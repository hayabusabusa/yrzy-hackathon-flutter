import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  /// 割合の値、色付きの星を表示する数.
  final int rate;
  /// 割合の最大値、星の数.
  final int maxRate;
  /// 星のサイズ.
  final double size;
  /// 色付きで表す星の色.
  final Color fillColor;
  /// 空(から)の星の色.
  final Color blankColor;

  const StarRate({
    Key? key,
    required this.rate,
    this.maxRate = 5,
    this.size = 24,
    this.fillColor = Colors.yellow,
    this.blankColor = Colors.grey,
  }): assert(
        rate >= 0, // `rate` は負の数を許可しない.
        rate <= maxRate // `rate` は `maxRate` を超えない. 
      ),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<bool>.generate(maxRate, (index) => index < rate)
        .map((isFill) {
          return isFill 
            ? Icon(
              Icons.star_rounded,
              size: size,
              color: fillColor,
            ) 
            : Icon(
              Icons.star_border_rounded,
              size: size,
              color: blankColor,
            );
        })
        .toList(),
    );
  }
}