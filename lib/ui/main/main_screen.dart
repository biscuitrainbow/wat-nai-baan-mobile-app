import 'package:buddish_project/ui/login/login_container.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget currentPage;

  @override
  void initState() {
    currentPage = LoginContainer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentPage;
  }
}
