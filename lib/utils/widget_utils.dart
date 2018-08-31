import 'package:buddish_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildAppBar({@required String title, List<Widget> actions = const []}) {
  return AppBar(
    elevation: 1.0,
    title: Text(title, style: AppStyle.appbarTitle),
    iconTheme: IconThemeData(color: AppColors.primary),
    actions: actions,
  );
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 3,
    bgcolor: "#000000",
    textcolor: '#ffffff',
  );
}
