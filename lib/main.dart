import 'dart:io';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/redux/app/app_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/store.dart';
import 'package:buddish_project/ui/login/login_container.dart';
import 'package:buddish_project/ui/login/login_screen.dart';
import 'package:buddish_project/ui/main/main_container.dart';
import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:buddish_project/ui/praying/praying_container.dart';
import 'package:buddish_project/ui/praying/praying_screen.dart';
import 'package:buddish_project/ui/sermon/sermon_screen.dart';
import 'package:buddish_project/ui/splash/splash_screen.dart';
import 'package:buddish_project/ui/survey/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:redux/redux.dart';

void main() async {
  HttpOverrides.global = new StethoHttpOverrides();

  var store = await createStore();
  runApp(new MyApp(store: store));
}

class MyApp extends StatefulWidget {
  const MyApp({this.store});

  final Store<AppState> store;

  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    widget.store.dispatch(Init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textSelectionColor: AppColors.main,
        ),
        home: SplashScreen(),
        routes: {
          MainScreen.route: (context) => MainContainer(),
          MenuScreen.route: (context) => MenuScreen(),
          SermonScreen.route: (context) => SermonScreen(),
          LoginScreen.route: (context) => LoginContainer(),
          PrayingScreen.route: (context) => PrayingContainer(),
          SurveyScreen.route: (context) => SurveyScreen(),
        },
      ),
    );
  }
}
