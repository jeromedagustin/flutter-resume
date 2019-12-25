import 'package:flutter/material.dart';

import 'pages/education_page.dart';
import 'pages/experience_page.dart';
import 'pages/objective_page.dart';
import 'pages/project_pages.dart';
import 'pages/qualifications_page.dart';
import 'pages/skills_page.dart';
import 'pages/title_page.dart';
import './widgets/social_footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isAllHidden = true;
  bool _heightSet = false;
  double _containerHeight = 0;
  Animation animation;
  Animation animation2;
  Animation<double> animation3;
  Animation<double> animation4;
  AnimationController animController;
  AnimationController animControllerTitle;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animControllerTitle = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = ColorTween(
      begin: Colors.grey[100],
      end: Colors.grey[400],
    ).animate(animController)
      ..addListener(() {
        setState(() {});
      });

    animation2 = ColorTween(
      begin: Colors.grey[400],
      end: Colors.grey[100],
    ).animate(animController)
      ..addListener(() {
        setState(() {});
      });

    animation3 = Tween(begin: 0.0, end: 25.0).animate(animController)
      ..addListener(() {
        setState(() {});
      });
    animation4 = Tween(begin: 24.0, end: 0.0).animate(animController)
      ..addListener(() {
        setState(() {});
      });

    animController.forward();
  }

  void _setHeight(bool heightSet) {
    if (heightSet == false) {
      _containerHeight = 0;
    } else {
      _containerHeight = MediaQuery.of(context).size.height;
    }
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _containerHeightReverse;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jerome Dean Agustin',
          style: TextStyle(
            fontSize: animation4.value,
          ),
        ),
        elevation: isAllHidden ? 6 : 10,
        backgroundColor: animation.value,
        centerTitle: true,
        actions: <Widget>[
          RaisedButton(
            child: Text(
              isAllHidden ? 'SHOW' : 'HIDE',
            ),
            onPressed: () {
              setState(() {
                isAllHidden = !isAllHidden;
                _heightSet = !_heightSet;
                _setHeight(_heightSet);
                if (isAllHidden) {
                  _containerHeightReverse = 0;
                  animController.forward();
                } else if (!isAllHidden) {
                  _containerHeightReverse = MediaQuery.of(context).size.height;
                  animController.reverse();
                }
                print(_containerHeightReverse);
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(animation3.value),
                bottomLeft: Radius.circular(animation3.value),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            elevation: 10,
            color: animation2.value,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.grey[50],
                Colors.grey[100],
                Colors.grey[200],
                Colors.grey[300],
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 20),
              if (isAllHidden)
                TitlePage(),
              // MailingList(),
              Divider(
                thickness: 2,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: _containerHeight,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ObjectivePage(isAllHidden),
                      QualificationsPage(),
                      ExperiencePage(),
                      SkillsPage(),
                      EducationPage(),
                      ProjectPage(),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              // if (!isAllHidden)
              //   AnimatedContainer(
              //     duration: Duration(seconds: 1),
              //     height: _containerHeightReverse,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //     ),

              //     // TODO: Insert an image, animation, or video

              //     child: Padding(
              //       padding: const EdgeInsets.all(200.0),
              //       child: Center(
              //           // child: Text('',),
              //           ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
      bottomSheet: SocialFooter(),
      resizeToAvoidBottomInset: false,
    );
  }
}
