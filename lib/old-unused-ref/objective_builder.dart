import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ObjectiveBuilder extends StatelessWidget {
  final Animation<int> characterCount;
  final int stringIndex;
  final List<String> objectiveText; 

  ObjectiveBuilder({
    @required this.characterCount,
    @required this.stringIndex,
    @required this.objectiveText,
  });

  String get _currentString =>
      objectiveText[stringIndex % objectiveText.length];

  @override
  Widget build(BuildContext context) {
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
          Card(
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: characterCount == null
                    ? null
                    : AnimatedBuilder(
                        animation: characterCount,
                        builder: (BuildContext context, Widget child) {
                          String text = _currentString.substring(
                              0, characterCount.value);
                          return Text(text);
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
