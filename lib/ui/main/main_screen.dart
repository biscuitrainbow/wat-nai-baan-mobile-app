import 'package:buddish_project/ui/login/login_container.dart';
import 'package:buddish_project/ui/main/main_container.dart';
import 'package:buddish_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static final String route = '/';

  final MainScreenViewModel viewModel;

  MainScreen({
    this.viewModel,
  });

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  Widget currentPage;
  AnimationController animationController;

  void _showLogin() {
    setState(() {
      this.currentPage = LoginContainer();
    });
  }

  @override
  void initState() {
    super.initState();

    currentPage = SplashScreen();

    animationController = new AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _showLogin();
        }
      });
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: currentPage);
  }
}
