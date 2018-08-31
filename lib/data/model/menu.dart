import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/activity_list/activity_list_screen.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:buddish_project/ui/praying/praying_screen.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_screen.dart';
import 'package:buddish_project/ui/survey/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu {
  final String title;
  final List<MenuCategory> categories;
  final String route;
  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;

  Menu({
    @required this.title,
    @required this.categories,
    @required this.route,
    @required this.icon,
    @required this.primaryColor,
    @required this.secondaryColor,
  });

  static List<Menu> get menus {
    return [
      Menu(
        title: 'ข่าวสาร\nทางพระพุทธศาสนา',
        route: NewsListScreen.route,
        icon: AppAsset.iconNewspaper,
        primaryColor: Color(0xFFAD4C3C),
        secondaryColor: Color(0xFFF9BFB9),
        categories: [
          MenuCategory.panya(primaryColor: Color(0xFFAD4C3C)),
        ],
      ),
      Menu(
        title: 'ฟังเทศน์ ฟังธรรม',
        route: SermonVideoScreen.route,
        icon: AppAsset.iconBuddha,
        primaryColor: Color(0xFF363C72),
        secondaryColor: Color(0xFFAEDED5),
        categories: [
          MenuCategory.samathi(primaryColor: Color(0xFF363C72)),
        ],
      ),
      Menu(
        title: 'สวดมนต์',
        route: PrayingScreen.route,
        icon: AppAsset.iconPray,
        primaryColor: Color(0xFFA23825),
        secondaryColor: Color(0xFFF9A479),
        categories: [
          MenuCategory.samathi(primaryColor: Color(0xFFA23825)),
        ],
      ),
      Menu(
        title: 'กิจกรรมสะสมบุญ',
        route: ActivityListScreen.route,
        icon: AppAsset.iconTrophy,
        primaryColor: Color(0xFF2A733A),
        secondaryColor: Color(0xFF8AC96F),
        categories: [
          MenuCategory.seen(primaryColor: Color(0xFF2A733A)),
        ],
      ),
      Menu(
        title: 'รับศีล',
        route: SurveyScreen.route,
        icon: AppAsset.iconPrayer,
        primaryColor: Color(0xFF8856A4),
        secondaryColor: Color(0xFFDEC1DC),
        categories: [
          MenuCategory.seen(primaryColor: Color(0xFF8856A4)),
        ],
      ),
    ];
  }
}

class MenuCategory {
  static final double size = 28.0;
  static final Color iconColor = AppColors.primary;

  static const String categorySeen = 'ศีล';
  static const String categoryPanya = 'ปัญหา';
  static const String categorySamathi = 'สมาธิ';
  static const List<String> category = [
    categorySeen,
    categorySamathi,
    categoryPanya,
  ];

  final String title;
  final Widget icon;
  final Color primaryColor;

  static Widget _buildIcon(String icon, Color color) {
    return SvgPicture.asset(
      AppAsset.iconSeen,
      color: color,
      height: size,
      width: size,
    );
  }

  MenuCategory.seen({
    this.title = categorySeen,
    @required this.primaryColor,
  }) : this.icon = _buildIcon(AppAsset.iconSeen, primaryColor);

  MenuCategory.samathi({
    this.title = categorySamathi,
    @required this.primaryColor,
  }) : this.icon = _buildIcon(AppAsset.iconSamathi, primaryColor);

  MenuCategory.panya({
    this.title = categoryPanya,
    @required this.primaryColor,
  }) : this.icon = _buildIcon(AppAsset.iconPanya, primaryColor);
}
