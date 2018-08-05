import 'package:flutter/material.dart';

class Asset {
  static final String imageLoginBg = 'asset/img/login_bg.png';
}

class Dimension {
  static final double screenHorizonPadding = 16.0;
  static final double screenVerticalPadding = 16.0;

  static final double fieldVerticalMargin = 12.0;
}

class AppColors {
  static final Color main = Color.fromRGBO(163, 84, 60, 1.0);
  static final Color facebook = Color(0xFF4267B2);
}

class Style {
  static final TextStyle appbarTitleStyle = TextStyle(color: AppColors.main, fontWeight: FontWeight.w600);
}
