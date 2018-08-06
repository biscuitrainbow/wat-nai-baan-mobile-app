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
import 'package:buddish_project/ui/survey/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() async {
  var store = await createStore();

  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
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
