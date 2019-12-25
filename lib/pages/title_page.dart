import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TitlePage extends StatefulWidget {
  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  final String welcome = '                 Welcome to Jerome Agustin\'s Resume Page!                 ';

  final String intro =
      'This webpage is designed completely using Flutter web!';

  final String intro2 =
      'Feedback is very much appreciated with the social buttons at the bottom!';

  final String intro3 =
      'This project will be updated with new features and simplified methods every week.';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: TyperAnimatedTextKit(
              text: [
                welcome,
                intro,
                intro2,
                intro3,
                // enjoy,
              ],
              duration: const Duration(seconds: 20),
              textStyle: TextStyle(fontSize: 24,),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
