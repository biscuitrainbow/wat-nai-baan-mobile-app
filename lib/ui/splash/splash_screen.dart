import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:buddish_project/ui/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(duration: Duration(seconds: 3), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacementNamed(MainScreen.route);
//          Navigator.of(context).pushNamed(OnBoardingScreen.route);

          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute<bool>(
              fullscreenDialog: true,
              builder: (BuildContext context) => new OnBoardingScreen(),
            ),
          );
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
