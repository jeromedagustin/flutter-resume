import 'package:flutter/material.dart';

class ExperiencePage extends StatefulWidget {
  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  bool isExperienceHidden = true;
  double _currentOpacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                curve: Curves.bounceIn,
                opacity: _currentOpacity,
                duration: const Duration(milliseconds: 700),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      isExperienceHidden = !isExperienceHidden;
                      if (_currentOpacity == 0.1)
                        _currentOpacity = 1.0;
                      else if (_currentOpacity == 1.0) _currentOpacity = 0.1;
                    });
                  },
                  child: Text(
                    'Professional Experience',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              if (!isExperienceHidden)
                Column(
                  children: <Widget>[
                    JobCard(
                      company: 'Sonos',
                      jobTitle: 'DevOps Engineer',
                      dates: 'Nov 2017 - May 2018',
                      location: 'Santa Barbara',
                      experience: [
                        'Admin for Amazon Web Services, Ansible Tower, and Perforce users',
                        'Rewrote and organized software development tools documentation',
                        'Developed a script to reduce Amazon Web Services Cloudwatch logs',
                      ],
                    ),
                    JobCard(
                      company: 'Sonos',
                      jobTitle: 'Software Test Engineer',
                      dates: 'Nov 2013 - Nov 2017',
                      location: 'Santa Barbara',
                      experience: [
                        'Lead the software manufacturing testing of Play:1, Boost, Play:5 gen2, Playbase',
                        'Created and reviewed regression test plans for the Alpha, Beta, and GA releases',
                        'Mentored new software test engineers and external testers',
                        'Found a major issue with the Sonos Boost before it went to mass production',
                      ],
                    ),
                    JobCard(
                      company: 'Sonos',
                      jobTitle: 'Associate Software Test Engineer',
                      dates: 'Feb 2013 - Nov 2013',
                      location: 'Santa Barbara',
                      experience: [
                        'Ensured proper software testing and allowed no major bugs into releases',
                        'Improved the software testing process with documentation',
                        'Responsible for the test case handoff process',
                      ],
                    ),
                    JobCard(
                      company: 'Sonos',
                      jobTitle: 'Software Engineering in Test Intern',
                      dates: 'Nov 2012 - Feb 2013',
                      location: 'Santa Barbara',
                      experience: [
                        'Executed and refined test cases and test plans for software controllers and hardware speakers',
                        'Performed ad-hoc testing to find areas of missing coverage',
                        'Updated the internal software testing onboarding documentation',
                      ],
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

class JobCard extends StatefulWidget {
  final String jobTitle;
  final String company;
  final String dates;
  final String location;
  final List<String> experience;

  JobCard({
    @required this.jobTitle,
    @required this.company,
    @required this.dates,
    @required this.location,
    this.experience,
  });

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print('tapped');
        });
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
              width: MediaQuery.of(context).size.width * 0.95,
              // decoration: BoxDecoration(border: Border.all() ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.jobTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.company,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all() ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.dates,
                          style: TextStyle(
                            fontFamily: 'Lato',
                          ),
                        ),
                        Text(
                          widget.location,
                          style: TextStyle(
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    widget.experience != null ? widget.experience.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  return Wrap(
                    children: <Widget>[
                      Text(
                        '• ${widget.experience[index]}',
                        style: TextStyle(
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
