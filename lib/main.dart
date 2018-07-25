import 'package:buddish_project/ui/main/main_container.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MainContainer(),
        '/menu': (context) => MenuScreen(),
      },
    );
  }
}
