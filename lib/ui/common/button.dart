import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color titleColor;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const Button({
    this.title,
    this.titleColor = Colors.white,
    this.onPressed,
    this.backgroundColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 1.0,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      minWidth: MediaQuery.of(context).size.width,
      child: Text(
        title,
        style: TextStyle(fontSize: 16.0, color: titleColor, fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
      color: backgroundColor,
    );
  }
}
