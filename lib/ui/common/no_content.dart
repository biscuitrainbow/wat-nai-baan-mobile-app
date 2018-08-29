import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoContent extends StatelessWidget {
  final String title;
  final IconData icon;

  NoContent({
    @required this.title,
    this.icon = FontAwesomeIcons.meh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 46.0,
          ),
          SizedBox(height: 16.0),
          Text(title)
        ],
      ),
    );
  }
}
