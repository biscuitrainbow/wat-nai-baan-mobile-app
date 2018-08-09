import 'package:buddish_project/ui/login/login_container.dart';
import 'package:buddish_project/ui/main/main_container.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:buddish_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static final String route = '/main';

  final MainScreenViewModel viewModel;

  MainScreen({
    this.viewModel,
  });

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget currentScreen;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.viewModel.token);

    return Scaffold(
      body: widget.viewModel.token == null ? LoginContainer() : MenuScreen(),
    );
  }
}
