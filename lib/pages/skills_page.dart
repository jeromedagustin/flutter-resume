import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widgets/scaling_transition_part.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> with TickerProviderStateMixin {
  Duration animDuration;
  double animHeight;
  Animation<Offset> animation;
  Animation<Offset> animation2;
  Animation<Offset> animation3;
  Animation animation4;
  AnimationController animController;
  AnimationController animController2;
  AnimationController animController3;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animController2 = AnimationController(
      duration: Duration(milliseconds: 1700),
      vsync: this,
    );
    animController3 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
        .animate(animController);
    animation2 = Tween<Offset>(begin: Offset(3, 3), end: Offset(0, 0))
        .animate(animController2);
    animation3 = Tween<Offset>(begin: Offset(-3, -3), end: Offset(0, 0))
        .animate(animController2);
    animation4 = Tween<double>(begin: 0, end: 4 * math.pi)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(animController3)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    animController.dispose();
    animController2.dispose();
    animController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                top: animController.isDismissed ? 60 : 0, 
                right: 120,
                left: 120,
              duration: Duration(milliseconds: 400),
                child: Transform.rotate(
                  angle: animation4.value,
                  child: FlatButton(
                    child: Text(
                      'Technical Skills',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      if (animController.isDismissed) {
                        animController.forward();
                        animController2.forward();
                        animController3.forward();
                        return;
                      }
                      animController.reverse();
                      animController2.reverse();
                      animController3.reverse();
                    },
                  ),
                ),
              ),
              // if (!isSkillsHidden) 
              Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  SlideTransition(
                    position: animation,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          children: <Widget>[
                            SlideTransition(
                              position: animation2,
                              child: SkillsRow(
                                skillTitle: 'Languages',
                                skillList: [
                                  'Dart',
                                  'React.js',
                                  'Python',
                                  'Bash',
                                ],
                              ),
                            ),
                            SlideTransition(
                              position: animation3,
                              child: SkillsRow(
                                skillTitle: 'Services',
                                skillList: [
                                  'Amazon Web Services',
                                  'Firebase',
                                  'GitHub',
                                ],
                              ),
                            ),
                            SlideTransition(
                              position: animation2,
                              child: SkillsRow(
                                skillTitle: 'Frameworks',
                                skillList: [
                                  'Flutter',
                                  'React',
                                  'Gatsby.js',
                                  'Django',
                                ],
                              ),
                            ),
                            SlideTransition(
                              position: animation3,
                              child: SkillsRow(
                                skillTitle: 'Tools',
                                skillList: [
                                  'Visual Studio Code',
                                  'Atom',
                                  'Git',
                                  'Lighthouse',
                                  'Xcode',
                                  'Android Studio',
                                ],
                              ),
                            ),
                            SlideTransition(
                              position: animation2,
                              child: SkillsRow(
                                skillTitle: 'Other',
                                skillList: [
                                  'MacOSX',
                                  'Agile',
                                  'Test Engineering',
                                  'Release Engineering',
                                  'DevOps',
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillsRow extends StatelessWidget {
  final String skillTitle;
  final List<String> skillList;

  SkillsRow({
    @required this.skillTitle,
    @required this.skillList,
  });

  @override
  Widget build(BuildContext context) {
    final skills = skillList.reduce((value, element) => value + ', ' + element);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            skillTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child:
              Wrap(
            children: <Widget>[
              Text(
                skills,
                style: TextStyle(
                  fontFamily: 'Lato',
                ),
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        // ),
      ],
    );
  }
}
