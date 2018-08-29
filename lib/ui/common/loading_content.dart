import 'package:flutter/material.dart';

class LoadingContent extends StatelessWidget {
  final String text;

  LoadingContent({
    this.text = 'กำลังโหลด',
  });

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: new CircularProgressIndicator(),
        ),
        SizedBox(height: 16.0),
        Text(text, style: new TextStyle(color: Colors.grey))
      ],
    );
  }
}
