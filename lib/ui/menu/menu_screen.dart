import 'package:buddish_project/constants.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/news_compose/news_compose_screen.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:buddish_project/ui/onboarding/onboarding_screen.dart';
import 'package:buddish_project/ui/praying/praying_screen.dart';
import 'package:buddish_project/ui/profile/profile_screen.dart';
import 'package:buddish_project/ui/sermon/sermon_screen.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_screen.dart';
import 'package:buddish_project/ui/survey/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';

class MenuScreen extends StatefulWidget {
  static final String route = '/menu';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _openDrawer(BuildContext scaffoldContext) {
    Scaffold.of(scaffoldContext).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 48.0),
              DrawerItem(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(ProfileScreen.route);
                },
                icon: Icons.person,
                title: 'ข้อมูลผู้ใช้',
              ),
              SizedBox(height: 16.0),
              DrawerItem(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(OnBoardingScreen.route);
                },
                icon: FontAwesomeIcons.stackOverflow,
                title: 'ไตรสิขา',
              ),
              SizedBox(height: 16.0),
              DrawerItem(
                icon: Icons.call_missed_outgoing,
                title: 'ลงชื่ออก',
                onPressed: () {
                  final Store<AppState> store = StoreProvider.of(context);
                  store.dispatch(Logout());
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext scaffoldContext) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.main,
            ),
            onPressed: () => _openDrawer(scaffoldContext),
          );
        }),
        elevation: 1.0,
        title: Text(
          'หน้าหลัก',
          style: AppStyle.appbarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.screenVerticalPadding),
          child: Column(
            children: <Widget>[
              new Menu(
                title: 'ข่าวสารทางพระพุทธศาสนา',
                titleColor: Color(0xFFAD4C3C),
                backgroundColor: Color(0xFFF9BFB9),
                onPressed: () => Navigator.of(context).pushNamed(NewsListScreen.route),
              ),
              new Menu(
                title: 'ฟังเทศน์ ฟังธรรม',
                titleColor: Color(0xFF363C72),
                backgroundColor: Color(0xFFAEDED5),
                onPressed: () => Navigator.of(context).pushNamed(SermonVideoScreen.route),
              ),
              new Menu(
                title: 'สวดมนต์',
                titleColor: Color(0xFFA23825),
                backgroundColor: Color(0xFFF9A479),
                onPressed: () => Navigator.of(context).pushNamed(PrayingScreen.route),
              ),
              new Menu(
                title: 'สะสมบุญ 9 วัด',
                titleColor: Color(0xFF2A733A),
                backgroundColor: Color(0xFF8AC96F),
                onPressed: () => print(''),
              ),
              new Menu(
                title: 'แบบทดสอบสุขภาพจิต',
                titleColor: Color(0xFF8856A4),
                backgroundColor: Color(0xFFDEC1DC),
                onPressed: () => Navigator.of(context).pushNamed(SurveyScreen.route),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  DrawerItem({
    this.title,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Icon(this.icon, color: Colors.grey[600]),
            SizedBox(width: 8.0),
            Text(
              this.title,
              style: TextStyle(color: Colors.grey[600], fontSize: 18.0),
            )
          ],
        ));
  }
}

class Menu extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double fontSize;

  Menu({
    @required this.title,
    @required this.titleColor,
    @required this.backgroundColor,
    @required this.onPressed,
    this.fontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
        height: 100.0,
        width: double.infinity,
        color: backgroundColor,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: titleColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
