import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/activity_list/activity_list_screen.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:buddish_project/ui/praying/praying_screen.dart';
import 'package:buddish_project/ui/rub_seen/rub_seen_screen.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_screen.dart';
import 'package:buddish_project/ui/wipasana_list/wipasana_list_screen.dart';
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
          MenuCategory.panya(primaryColor: Color(0xFFAD4C3C), secondaryColor: Colors.white),
        ],
      ),
      Menu(
        title: 'อาราธนาศีล รับศีล',
        route: RubSeenScreen.route,
        icon: AppAsset.iconBuddha,
        primaryColor: Color(0xFFA23825),
        secondaryColor: Color(0xFFF9A479),
        categories: [
          MenuCategory.seen(primaryColor: Color(0xFFA23825), secondaryColor: Colors.white),
        ],
      ),
      Menu(
        title: 'วิปัสสนากรรมฐาน',
        route: WipasanaListScreen.route,
        icon: AppAsset.iconPrayer,
        primaryColor: Color(0xFF8856A4),
        secondaryColor: Color(0xFFDEC1DC),
        categories: [
          MenuCategory.panya(primaryColor: Color(0xFF8856A4), secondaryColor: Colors.white),
        ],
      ),
      Menu(
        title: 'ฟังเทศน์ ฟังธรรม',
        route: SermonVideoScreen.route,
        icon: AppAsset.iconBuddha,
        primaryColor: Color(0xFF363C72),
        secondaryColor: Color(0xFFAEDED5),
        categories: [
          MenuCategory.samathi(primaryColor: Color(0xFF363C72), secondaryColor: Colors.white),
        ],
      ),
      Menu(
        title: 'สวดมนต์',
        route: PrayingScreen.route,
        icon: AppAsset.iconPray,
        primaryColor: Color(0xFFA23825),
        secondaryColor: Color(0xFFF9A479),
        categories: [
          MenuCategory.samathi(primaryColor: Color(0xFFA23825), secondaryColor: Colors.white),
        ],
      ),
      Menu(
        title: 'กิจกรรมสะสมบุญ',
        route: ActivityListScreen.route,
        icon: AppAsset.iconTrophy,
        primaryColor: Color(0xFF2A733A),
        secondaryColor: Color(0xFF8AC96F),
        categories: [
          MenuCategory.seen(primaryColor: Color(0xFF2A733A), secondaryColor: Colors.white),
        ],
      ),
    ];
  }
}

class MenuCategory {
  static final double size = 28.0;
  static final Color iconColor = AppColors.primary;

  static const String categorySeen = 'ศีล';
  static const String categorySamathi = 'สมาธิ';
  static const String categoryPanya = 'ปัญญา';

  static final List<MenuCategory> category = [
    MenuCategory.seen(primaryColor: AppColors.primary, secondaryColor: Colors.white),
    MenuCategory.samathi(primaryColor: AppColors.primary, secondaryColor: Colors.white),
    MenuCategory.panya(primaryColor: AppColors.primary, secondaryColor: Colors.white),
  ];

  final String title;
  final Widget primaryIcon;
  final Widget secondaryIcon;

  final Color primaryColor;
  final Color secondaryColor;

  static Widget buildIcon(String icon, [Color color = Colors.grey]) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: size,
      width: size,
    );
  }

  MenuCategory.seen({
    this.title = categorySeen,
    @required this.secondaryColor,
    @required this.primaryColor,
  })  : this.primaryIcon = buildIcon(AppAsset.iconSeen, primaryColor),
        this.secondaryIcon = buildIcon(AppAsset.iconSeen, secondaryColor);

  MenuCategory.samathi({
    this.title = categorySamathi,
    @required this.secondaryColor,
    @required this.primaryColor,
  })  : this.primaryIcon = buildIcon(AppAsset.iconSamathi, primaryColor),
        this.secondaryIcon = buildIcon(AppAsset.iconSamathi, secondaryColor);

  MenuCategory.panya({
    this.title = categoryPanya,
    @required this.secondaryColor,
    @required this.primaryColor,
  })  : this.primaryIcon = buildIcon(AppAsset.iconPanya, primaryColor),
        this.secondaryIcon = buildIcon(AppAsset.iconPanya, secondaryColor);

  @override
  bool operator ==(Object other) => identical(this, other) || other is MenuCategory && runtimeType == other.runtimeType && title == other.title;

  @override
  int get hashCode => title.hashCode ^ primaryIcon.hashCode;

  @override
  String toString() {
    return 'MenuCategory{title: $title, icon: $primaryIcon, primaryColor: $primaryColor}';
  }
}
