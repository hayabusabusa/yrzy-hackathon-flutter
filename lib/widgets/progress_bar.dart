import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  /// `AppBar` の `bottom` に指定するために必要なサイズ.
  static Size preferredSize = Size.fromHeight(40);

  /// 分母となる最大値.
  final int max;
  /// 現在の値、この値は `max` 以下にならないとエラーになる.
  final int current;
  /// バーの色.
  final Color barColor;
  /// テキスト部分の色.
  final Color textColor;
  /// バーの後ろの色.
  final Color backgroundColor;

  ProgressBar({
    Key? key,
    required this.max,
    required this.current,
    this.barColor = Colors.blue,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.black12,
  }): assert(current <= max), 
      super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    final end = widget.current / widget.max;
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: end)
      .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addListener(() { 
        setState(() { });
      });

    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant ProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.current != widget.current) {
      final begin = oldWidget.current / oldWidget.max;
      final end = widget.current / widget.max;

      _animationController.duration = Duration(milliseconds: 200);
      _animation = Tween(begin: begin, end: end)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
        ..addListener(() {
          setState(() { });
        });

      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${widget.current} / ${widget.max}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.textColor,
            ),
          ),
          const SizedBox(height: 4),
          CustomPaint(
            size: Size.fromHeight(8),
            foregroundPainter: _ProgressPainter(
              barColor: widget.barColor, 
              backgroundColor: widget.backgroundColor,
              currentProgress: _animation.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  Color barColor;
  Color backgroundColor;
  double currentProgress;

  _ProgressPainter({
    required this.barColor,
    required this.backgroundColor,
    required this.currentProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerRrect = RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(size.height / 2));
    final innerRrect = RRect.fromLTRBR(0, 0, size.width * currentProgress, size.height, Radius.circular(size.height / 2));

    final outerPaint = Paint();
    outerPaint.color = backgroundColor;
    final innerPaint = Paint();
    innerPaint.color = barColor;
    
    canvas.drawRRect(outerRrect, outerPaint);
    canvas.drawRRect(innerRrect, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return currentProgress <= 100;
  }
}