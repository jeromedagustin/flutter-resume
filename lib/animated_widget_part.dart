import 'package:flutter/material.dart';

class AnimatedWidgetPart extends AnimatedWidget {
  AnimatedWidgetPart({
    Key key,
    @required Animation<double> animation,
  }) : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Transform.rotate(
      angle: animation.value,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Image.asset(
          "/images/cartoon-eyes.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
