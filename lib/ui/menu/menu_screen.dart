import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/menu.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/common/filter_bar.dart';
import 'package:buddish_project/ui/onboarding/onboarding_screen.dart';
import 'package:buddish_project/ui/profile/profile_screen.dart';
import 'package:buddish_project/ui/rub_seen/rub_seen_screen.dart';
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
  List<MenuCategory> _categories = [];
  String _selectedCategory = null;

  List<Menu> _menus = [];

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
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
                DrawerItem(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(RubSeenScreen.route);
                  },
                  icon: FontAwesomeIcons.handHolding,
                  title: 'อาราธนาศีล',
                ),
                SizedBox(height: 16.0),
                DrawerItem(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(OnBoardingScreen.route);
                  },
                  icon: FontAwesomeIcons.stackOverflow,
                  title: 'ไตรสิกขา',
                ),
                SizedBox(height: 16.0),
                DrawerItem(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(SurveyScreen.route);
                  },
                  icon: Icons.format_list_bulleted,
                  title: 'แบบทดสอบสุขภาพจิต',
                ),
                SizedBox(height: 16.0),
              ],
            ),
            Column(
              children: <Widget>[
                DrawerItem(
                  icon: Icons.call_missed_outgoing,
                  title: 'ลงชื่ออก',
                  onPressed: () {
                    final Store<AppState> store = StoreProvider.of(context);
                    store.dispatch(Logout());
                  },
                ),
                SizedBox(height: 8.0),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _categories = MenuCategory.category;
    _menus = Menu.menus;
  }

  List<Menu> _getFilteredMenus() {
    if (_selectedCategory != null) {
      final selectedMenuCategory = _categories.firstWhere((MenuCategory category) => category.title == _selectedCategory);

      return _menus.where((Menu menu) => menu.categories.contains(selectedMenuCategory)).toList();
    }

    return _menus;
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
      body: Container(
        padding: EdgeInsets.only(
//          top: Dimension.screenHorizonPadding,
          left: Dimension.screenHorizonPadding,
          right: Dimension.screenHorizonPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            FilterBar.singleSelection(
              warped: true,
              items: _categories
                  .map(
                    (MenuCategory category) => FilterItem(
                          title: category.title,
                          selectedAvatar: category.primaryIcon,
                          deselectedAvatar: category.secondaryIcon,
                        ),
                  )
                  .toList(),
              textColor: Colors.black,
              backgroundColor: Colors.white,
              activeTextColor: Colors.white,
              activeBackgroundColor: AppColors.primary,
              onItemSelected: ((selected) {
                setState(() {
                  _selectedCategory = selected;
                });
              }),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _getFilteredMenus().length,
                itemBuilder: (BuildContext context, int index) {
                  final menu = _getFilteredMenus()[index];
                  return MenuItem(
                    menu: menu,
                    onPressed: () => _navigateToScreen(menu.route),
                  );
                },
              ),
            )
          ],
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
        children: menu.categories.map((MenuCategory category) => category.primaryIcon).toList(),
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
