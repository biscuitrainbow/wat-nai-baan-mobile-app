import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final String groupValue;
  final String value;
  final Function(String) onChanged;

  const RadioItem({
    this.groupValue,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          value,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16.0),
        ),
      ],
    );
  }
}
