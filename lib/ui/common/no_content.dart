import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoContent extends StatelessWidget {
  final String title;
  final IconData icon;

  const NoContent({
    Key key,
    @required this.title,
    this.icon = FontAwesomeIcons.meh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            size: 46.0,
          ),
          SizedBox(height: 16.0),
          new Text(title)
        ],
      ),
    );
  }
}
