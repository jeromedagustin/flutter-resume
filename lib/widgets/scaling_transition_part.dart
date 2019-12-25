import 'package:flutter/material.dart';

class ScalingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> scale;

  ScalingTransition({
    this.child,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scale,
      child: child,
      builder: (
        BuildContext context,
        Widget child,
      ) {
        return Transform.scale(
          scale: scale.value,
          child: child,
        );
      },
    );
  }
}
