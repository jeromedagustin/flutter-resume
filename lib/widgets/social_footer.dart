import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({
    Key key,
  }) : super(key: key);

  void _launchUrl(String url) {
    js.context.callMethod("open", [url]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Connect with me',
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
        IconButton(
          icon: Icon(MdiIcons.twitter),
          splashColor: Colors.transparent,
          onPressed: () {
            _launchUrl(
              'https://twitter.com/jeromedagustin',
            );
          },
        ),
        IconButton(
          icon: Icon(MdiIcons.instagram),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            _launchUrl(
              'https://www.instagram.com/jeromedean_theic/',
            );
          },
        ),
        IconButton(
          icon: Icon(MdiIcons.linkedinBox),
          highlightColor: Colors.transparent,
          onPressed: () {
            _launchUrl(
              'https://www.linkedin.com/in/jerome-agustin-ba838a47/',
            );
          },
        ),
        IconButton(
          icon: Icon(MdiIcons.githubBox),
          onPressed: () {
            _launchUrl(
              'https://github.com/jeromedagustin/',
            );
          },
        ),
        IconButton(
          icon: Icon(MdiIcons.discord),
          onPressed: () {
            _launchUrl(
              'https://discord.gg/TSkuSC',
            );
          },
        ),
      ],
    );
  }
}