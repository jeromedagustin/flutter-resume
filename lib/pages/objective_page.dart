import 'package:flutter/material.dart';

class ObjectivePage extends StatefulWidget {
  final bool stopAnim;

  ObjectivePage(
    this.stopAnim,
  );

  @override
  _ObjectivePageState createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage>
    with TickerProviderStateMixin {
  AnimationController animControllerObjective;
  Animation<int> _characterCount;

  int _stringIndex;
  final List<String> _objectiveText = <String>[
    'Looking to obtain a software engineering position where I can utilize my experience in development, testing, and documentation to develop high quality software that improves lives by simplifying tasks.',
  ];

  String get _currentString =>
      _objectiveText[_stringIndex % _objectiveText.length];

  @override
  void initState() {
    super.initState();
    animControllerObjective = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
  }

  @override
  void dispose() {
    animControllerObjective.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.stopAnim) {
      _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
      _characterCount = StepTween(begin: 0, end: _currentString.length)
          .animate(animControllerObjective);
      animControllerObjective.forward();
    } else if (widget.stopAnim) {
      _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
      _characterCount = StepTween(begin: 0, end: _currentString.length)
          .animate(animControllerObjective);
      animControllerObjective.reverse();
    }

    return Container(
      child: Column(
        children: <Widget>[
          const Text(
            'Objective',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          GestureDetector(
            onTap: (){
              if(animControllerObjective.isCompleted){
                animControllerObjective.reverse();
              } else if(animControllerObjective.isAnimating){
                animControllerObjective.reset();
              } else if(animControllerObjective.isDismissed){
                animControllerObjective.forward();
              }
            },
            child: Card(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: _characterCount == null
                      ? null
                      : AnimatedBuilder(
                          animation: _characterCount,
                          builder: (BuildContext context, Widget child) {
                            String text = _currentString.substring(
                                0, _characterCount.value);
                            return Text(text);
                          },
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
