import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  final List<String> schoolList = [
    'California State Polytechnic University of Pomona',
  ];
  final List<String> degreeList = [
    'B.S. Computer Engineering',
  ];
  final List<String> graduatedDateList = [
    '2011',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Education',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Card(
                child: Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: schoolList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Wrap(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                            child: Text(
                              schoolList[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(degreeList[index]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(graduatedDateList[index]),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
