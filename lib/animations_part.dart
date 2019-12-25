import 'package:flutter/material.dart';
import 'dart:math' as math;

import './animated_widget_part.dart';
import './widgets/scaling_transition_part.dart';
import './eyes_image.dart';

class AnimationsPart extends StatefulWidget {
  AnimationsPart({Key key}) : super(key: key);

  @override
  _AnimationsPartState createState() => _AnimationsPartState();
}

class _AnimationsPartState extends State<AnimationsPart>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animation2;
  AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    // animController.forward();
    // final curvedAnimation = CurvedAnimation(
    //   parent: animController,
    //   curve: Curves.bounceIn,
    //   reverseCurve: Curves.bounceInOut,
    // );

    animation = Tween<double>(begin: 0, end: 2 * math.pi)
        .chain(CurveTween(curve: Curves.easeInSine))
        .animate(animController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    animation2 = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(animController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: <Widget>[
        Container(
          child: Transform.rotate(
            angle: -animation.value,
            child: Image.asset(
              "/images/cartoon-eyes.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedWidgetPart(
          animation: animation,
        ),
        ScalingTransition(child: EyesImage(), scale: animation2),
        Container(
          child: Image.asset(
            "/images/cartoon-eyes.png",
            fit: BoxFit.cover,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
