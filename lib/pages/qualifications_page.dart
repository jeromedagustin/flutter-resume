import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widgets/scaling_transition_part.dart';

class QualificationsPage extends StatefulWidget {
  const QualificationsPage({Key key}) : super(key: key);

  @override
  _QualificationsPageState createState() => _QualificationsPageState();
}

class _QualificationsPageState extends State<QualificationsPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Widget _myAnimatedWidget;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0.5, end: 1)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animationController.forward();

    _myAnimatedWidget = Container(
      child: ScalingTransition(
        scale: animation,
        child: FlatButton(
          child: Text(
            'Show Me Why You Are Qualified',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onPressed: () {
            setState(() {
              _myAnimatedWidget = QualificationCard();
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      duration: Duration(milliseconds: 800),
      child: _myAnimatedWidget,
    );
  }
}

class QualificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> qualificationList = [
      '5 years of experience in software testing and release management',
      'History of problem solving, process development, and critical thinking skills',
      'High attention to detail',
      'Able to understand concepts quickly and efficiently',
      'Dart in Flutter development experience for mobile and web',
      'Python development experience with Django',
      'React development experience with Gatsby.js',
    ];

    return Column(
      children: <Widget>[
        Text(
          'Qualifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: qualificationList.length,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(
                  children: <Widget>[
                    Text(
                      '• ${qualificationList[index]}',
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
