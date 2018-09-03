import 'package:buddish_project/constants.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:buddish_project/ui/onboarding/onboarding_screen.dart';
import 'package:buddish_project/ui/rub_seen/rub_seen_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  void _showRubSeenScreen() {
    Navigator.of(context, rootNavigator: true).push(
      CupertinoPageRoute<bool>(
        fullscreenDialog: true,
        builder: (BuildContext context) => RubSeenScreen(),
      ),
    );
  }

  void _showOnBoardingScreen() {
    Navigator.of(context, rootNavigator: true).push(
      CupertinoPageRoute<bool>(
        fullscreenDialog: true,
        builder: (BuildContext context) => OnBoardingScreen(),
      ),
    );
  }

  @override
  void initState() {
    animationController = new AnimationController(duration: Duration(seconds: 3), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacementNamed(MainScreen.route);

          final Store<AppState> store = StoreProvider.of(context);
          final token = store.state.token;

          if (token != null) {
            _showRubSeenScreen();
          }

          _showOnBoardingScreen();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: Image.asset(AppAsset.imageLoginBg, fit: BoxFit.cover)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120.0),
              Text(
                'ด้วยความร่วมมือจาก',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Dimension.fieldVerticalMargin),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    AppAsset.logoCmu,
                    width: MediaQuery.of(context).size.width * .2,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    AppAsset.logoCamt,
                    width: MediaQuery.of(context).size.width * .24,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    AppAsset.logoMed,
                    width: MediaQuery.of(context).size.width * .24,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    AppAsset.logoMjr,
                    width: MediaQuery.of(context).size.width * .2,
                    fit: BoxFit.cover,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
