import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String title;

  LoadingDialog({
    this.title = 'กำลังโหลด',
  });

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
            CircularProgressIndicator(),
            SizedBox(width: 16.0),
            Text(title),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
