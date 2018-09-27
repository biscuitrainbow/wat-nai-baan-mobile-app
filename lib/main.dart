import 'package:after_layout/after_layout.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/redux/app/app_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/store.dart';
import 'package:buddish_project/ui/activity_compose/activity_add_container.dart';
import 'package:buddish_project/ui/activity_compose/activity_composer_screen.dart';
import 'package:buddish_project/ui/activity_list/activity_list_container.dart';
import 'package:buddish_project/ui/activity_list/activity_list_screen.dart';
import 'package:buddish_project/ui/login/login_container.dart';
import 'package:buddish_project/ui/login/login_screen.dart';
import 'package:buddish_project/ui/main/main_container.dart';
import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:buddish_project/ui/menu/menu_container.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:buddish_project/ui/news_compose/news_add_container.dart';
import 'package:buddish_project/ui/news_compose/news_compose_screen.dart';
import 'package:buddish_project/ui/news_list/news_list_container.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:buddish_project/ui/onboarding/onboarding_screen.dart';
import 'package:buddish_project/ui/praying/praying_container.dart';
import 'package:buddish_project/ui/praying/praying_screen.dart';
import 'package:buddish_project/ui/profile/profile_container.dart';
import 'package:buddish_project/ui/profile/profile_screen.dart';
import 'package:buddish_project/ui/register/register_container.dart';
import 'package:buddish_project/ui/register/register_screen.dart';
import 'package:buddish_project/ui/rub_seen/rub_seen_screen.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_container.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_screen.dart';
import 'package:buddish_project/ui/splash/splash_screen.dart';
import 'package:buddish_project/ui/survey/survey_screen.dart';
import 'package:buddish_project/ui/wipasana_list/wipasana_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() async {
  final store = await createStore();

  runApp(MyApp(store: store));
}

class MyApp extends StatefulWidget {
  const MyApp({this.store});

  final Store<AppState> store;

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with AfterLayoutMixin<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    widget.store.dispatch(Init(context));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'วัดในบ้าน',
        theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Colors.yellow,
          textSelectionColor: AppColors.primary,
        ),
        home: SplashScreen(),
        routes: {
          MainScreen.route: (context) => MainContainer(),
          MenuScreen.route: (context) => MenuContainer(),
          SermonVideoScreen.route: (context) => SermonVideoContainer(),
          LoginScreen.route: (context) => LoginContainer(),
          ProfileScreen.route: (context) => ProfileContainer(),
          NewsListScreen.route: (context) => NewsListContainer(),
          PrayingScreen.route: (context) => PrayingContainer(),
          SurveyScreen.route: (context) => SurveyScreen(),
          NewsComposeScreen.route: (context) => NewsComposeContainer(),
          ActivityListScreen.route: (context) => ActivityListContainer(),
          ActivityComposeScreen.route: (context) => ActivityAddContainer(),
          OnBoardingScreen.route: (context) => OnBoardingScreen(),
          WipasanaListScreen.route: (context) => WipasanaListScreen(),
          RubSeenScreen.route: (context) => RubSeenScreen(),
          RegisterScreen.route: (context) => RegisterContainer(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('th'),
        ],
      ),
    );
  }
}
