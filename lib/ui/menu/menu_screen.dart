import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/menu.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/onboarding/onboarding_screen.dart';
import 'package:buddish_project/ui/profile/profile_screen.dart';
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

  void _navigateToScreen(String route) {
    Navigator.of(context).pushNamed(route);
  }

  Widget _buildDrawer() {
    return Drawer(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext scaffoldContext) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColors.primary,
              ),
              onPressed: () => _openDrawer(scaffoldContext),
            );
          },
        ),
        elevation: 1.0,
        title: Text(
          'หน้าหลัก',
          style: AppStyle.appbarTitle,
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.screenHorizonPadding,
            vertical: Dimension.screenVerticalPadding,
          ),
          child: Column(
//            children: <Widget>[
//              MenuItem(
//                title: 'ข่าวสาร\nทางพระพุทธศาสนา',
//                titleColor: Color(0xFFAD4C3C),
//                backgroundColor: Color(0xFFF9BFB9),
//                onPressed: () => Navigator.of(context).pushNamed(NewsListScreen.route),
//              ),
//              MenuItem(
//                title: 'ฟังเทศน์ ฟังธรรม',
//                titleColor: Color(0xFF363C72),
//                backgroundColor: Color(0xFFAEDED5),
//                onPressed: () => Navigator.of(context).pushNamed(SermonVideoScreen.route),
//              ),
//              MenuItem(
//                title: 'สวดมนต์',
//                titleColor: Color(0xFFA23825),
//                backgroundColor: Color(0xFFF9A479),
//                onPressed: () => Navigator.of(context).pushNamed(PrayingScreen.route),
//              ),
//              MenuItem(
//                title: 'กิจกรรมสะสมบุญ',
//                titleColor: Color(0xFF2A733A),
//                backgroundColor: Color(0xFF8AC96F),
//                onPressed: () => Navigator.of(context).pushNamed(ActivityListScreen.route),
//              ),
//              MenuItem(
//                title: 'แบบทดสอบสุขภาพจิต',
//                titleColor: Color(0xFF8856A4),
//                backgroundColor: Color(0xFFDEC1DC),
//                onPressed: () => Navigator.of(context).pushNamed(SurveyScreen.route),
//              ),
//            ],
            children: Menu.menus.map((Menu menu) => MenuItem(menu: menu, onPressed: () => _navigateToScreen(menu.route))).toList(),
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
    Widget _buildTitle() {
      return Text(
        this.title,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 18.0,
        ),
      );
    }

    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(this.icon, color: Colors.grey[600]),
          SizedBox(width: 8.0),
          _buildTitle(),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Menu menu;
  final VoidCallback onPressed;
  final double fontSize;
  final Color primaryColor;
  final Color secondaryColor;

  MenuItem({
    this.menu,
    this.onPressed,
    this.fontSize = 28.0,
    this.primaryColor = AppColors.primary,
    this.secondaryColor = AppColors.secondary,
  });

  Widget _buildCategoryIcon() {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      color: menu.secondaryColor,
      width: 32.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: menu.categories.map((MenuCategory category) => category.icon).toList(),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      menu.title,
      textAlign: TextAlign.start,
      style: TextStyle(color: menu.primaryColor, fontSize: fontSize, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildBackgroundIcon() {
    return Icon(
      menu.icon,
      size: 90.0,
      color: Colors.grey.shade100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
        height: 100.0,
        width: double.infinity,
        child: Stack(
          overflow: Overflow.clip,
          alignment: Alignment.centerRight,
          children: <Widget>[
            _buildBackgroundIcon(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildCategoryIcon(),
                _buildTitle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
