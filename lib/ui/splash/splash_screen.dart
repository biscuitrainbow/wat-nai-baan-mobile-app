import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacementNamed(MainScreen.route);
        }
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: Image.asset(Asset.imageLoginBg, fit: BoxFit.cover)),
      ],
    );
  }
}
