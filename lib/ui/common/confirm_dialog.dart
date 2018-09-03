import 'package:buddish_project/constants.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatefulWidget {
  final String title;
  final String description;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmDialog({
    this.title,
    this.description,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "ต้องการทำแบบสอบถามต่อหรือไม่",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.0, color: AppColors.primary, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12.0),
              Text(
                "ข้อมูลของคุณเพียงพอต่อการสรุปผลแล้ว",
                style: TextStyle(fontSize: 16.0, color: Colors.grey.shade500),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: widget.onCancel,
                    child: Text('ทำต่อ', style: TextStyle(color: AppColors.primary)),
                  ),
                  FlatButton(
                    onPressed: widget.onConfirm,
                    child: Text('สรุปผล', style: TextStyle(color: AppColors.primary)),
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
