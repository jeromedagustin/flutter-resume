import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  final Map<String, dynamic> homePage = {
    "Name": "Jerome Agustin Profile",
    "Description": "This is my profile site using Gatsby.js/React",
    "Link": "https://www.jeromeagustin.com/",
    "Status": "Completed",
  };
  final Map<String, dynamic> projectResume = {
    "Name": "Flutter Resume",
    "Description": "This is a site built using Flutter",
    "Link": "http://jeromeagustin.com/flutter-resume/",
    "Status": "In Progress",
  };
  final Map<String, dynamic> blog = {
    "Name": "Blog",
    "Description": "This is my blog site using Gatsby.js/React",
    "Link": "http://jeromeagustin.com/flutter-resume/",
    "Status": "In Progress",
  };
  final Map<String, dynamic> createMotiviation = {
    "Name": "m0tv8",
    "Description":
        "This will be an multi-platform application used motivation quote pictures and displayed in a shared gallery.",
    "Status": "Designing",
  };

  final Map<String, dynamic> starkApp = {
    "Name": "Stark",
    "Description":
        "This will be an multi-platform  application to help dog owners collaborate with each other to help create a local dog community.",
    "Status": "Future",
  };

  final Map<String, dynamic> sonosApp = {
    "Name": "osnso",
    "Description":
        "This will be an application built in Flutter to interact with Sonos",
    "Status": "Future",
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> projects = [
      homePage,
      projectResume,
      blog,
      createMotiviation,
      starkApp,
      sonosApp
    ];

    return Container(
      child: Column(
        children: <Widget>[
          const Text(
            'Projects',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            // padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: projects.length,
              itemBuilder: (BuildContext context, int index) {
                final data = projects[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: ListTile(
                      // TODO : Create a switch statement that will display an icon for the current status of the project
                      // leading: i 
                      title: Text(
                        '${data.values.elementAt(0)}',
                        style: TextStyle(
                          fontFamily: 'Lato',
                        ),
                      ),
                      subtitle: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length - 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '${data.keys.elementAt(index + 1)} : ${data.values.elementAt(index + 1)}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
