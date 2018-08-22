import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String title;

  const LoadingDialog({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
      children: <Widget>[
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new CircularProgressIndicator(),
            SizedBox(width: 16.0),
            Text('อัพโหลด...'),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
