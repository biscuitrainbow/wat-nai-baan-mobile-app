import 'package:flutter/material.dart';

class Asset {
  static final String imageLoginBg = 'asset/img/login_bg.png';

  static final String logoCmu = 'asset/logo/cmu.png';
  static final String logoCamt = 'asset/logo/camt.png';
  static final String logoMed = 'asset/logo/med.png';
  static final String lgoMjr = 'asset/logo/mjr.png';

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
  static final Color main = Color.fromRGBO(163, 84, 60, 1.0);
  static final Color secondary = Color(0xFFFCEA88);
  static final Color facebook = Color(0xFF4267B2);
}

class AppStyle {
  static final TextStyle appbarTitle = TextStyle(color: AppColors.main, fontWeight: FontWeight.w600);
  static final TextStyle snackBarMessage = TextStyle(color: Colors.white, fontWeight: FontWeight.w600);

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
  static final String httpApplicationJson = 'application/json';
}
