import 'package:flutter/material.dart';

/// contain all the app level transitions [animations]
class LoadTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  const LoadTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  Animation<double> get fadeTweenAnimation =>
      Tween<double>(begin: 0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut),
      );

  Animation<double> get scaleTweenAnimation =>
      Tween<double>(begin: 0.2, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(0.2, 1, curve: Curves.easeInCirc),
        ),
      );

  @override
  Widget build(BuildContext context) => ScaleTransition(
      scale: scaleTweenAnimation,
      alignment: Alignment.center,
      filterQuality: FilterQuality.low,
      child: FadeTransition(opacity: fadeTweenAnimation, child: child));
}
