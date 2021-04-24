import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute(
    this.page,
  ): super(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, _, child) => FadeTransition(opacity: animation, child: child,),
      fullscreenDialog: true,
    );
}