import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

class ViewModel {
  static ViewModel fromStore() {
    return ViewModel();
  }
}
