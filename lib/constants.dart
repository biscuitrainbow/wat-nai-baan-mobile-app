import 'package:flutter/material.dart';

class AppAsset {
  static final String imageLoginBg = 'asset/img/login_bg.png';

  static final String logoCmu = 'asset/logo/cmu.png';
  static final String logoCamt = 'asset/logo/camt.png';
  static final String logoMed = 'asset/logo/med.png';
  static final String logoMjr = 'asset/logo/mjr.png';

  static final String iconSeen = 'asset/icon/seen.svg';
  static final String iconSamathi = 'asset/icon/samathi.svg';
  static final String iconPanya = 'asset/icon/panya.svg';
  static final String iconLotus = 'asset/icon/lotus.png';
  static final String iconLotusWithText = 'asset/icon/lotus_with_text.png';
  static final String iconMainMenu = 'icon-menu';

  static IconData iconPray = IconData(0xe801, fontFamily: AppAsset.iconMainMenu);
  static IconData iconPrayer = IconData(0xe802, fontFamily: AppAsset.iconMainMenu);
  static IconData iconBuddha = IconData(0xe803, fontFamily: AppAsset.iconMainMenu);
  static IconData iconTrophy = IconData(0xe804, fontFamily: AppAsset.iconMainMenu);
  static IconData iconNewspaper = IconData(0xe805, fontFamily: AppAsset.iconMainMenu);

  static final String audioBundle = 'asset/audio';
  static final String audio1 = '1.mp3';
  static final String audio2 = '2.mp3';
  static final String audio3 = '3.mp3';
  static final String audio4 = '4.mp3';
  static final String audio5 = '5.mp3';
}

class Dimension {
  static final double screenHorizonPadding = 16.0;
  static final double screenVerticalPadding = 16.0;
  static final double fieldVerticalMargin = 12.0;
}

class AppColors {
  static const Color primary = Color.fromRGBO(163, 84, 60, 1.0);
  static const Color secondary = Color(0xFFFCEA88);
  static const Color facebook = Color(0xFF4267B2);
  static const Color gradientStart = Color(0xFFF6EB31);
  static const Color gradientEnd = Color(0xFFF9B923);
}

class AppStyle {
  static final TextStyle appbarTitle = TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600);
  static final TextStyle snackBarMessage = TextStyle(color: Colors.white, fontWeight: FontWeight.w600);
  static final TextStyle inputLabelStyle = TextStyle(color: Colors.black45, fontSize: 16.0, fontWeight: FontWeight.w400);

  static final InputDecoration textInputLogin = InputDecoration(
    border: InputBorder.none,
    fillColor: Colors.white,
    filled: true,
  );

  static final InputDecoration textInput = InputDecoration(
      labelStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      labelText: 'ชื่อ - นามสกุล',
      hintText: '',
      fillColor: Colors.grey.shade200,
      filled: true);

  static final inputStyle = InputDecoration(
    border: InputBorder.none,
//    labelStyle: TextStyle(
//      color: Colors.black54,
//      fontWeight: FontWeight.w300,
//    ),
    fillColor: Colors.grey.shade200,
    filled: true,
  );
}

class AppString {
  static final String dateOfBirthFormat = 'dd-MM-yyyy';
  static final String datetimeTextField = 'dd MMM yyyy HH:mm';
  static final String dateTextField = 'dd MMM yyyy';

  static final String httpApplicationJson = 'application/json';
}
