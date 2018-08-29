import 'package:buddish_project/constants.dart';
import 'package:flutter/material.dart';

Widget buildAppBar({
  @required String title,
  List<Widget> actions = const [],
}) {
  return AppBar(
    elevation: 1.0,
    title: Text(title, style: AppStyle.appbarTitle),
    iconTheme: IconThemeData(color: AppColors.main),
    actions: actions,
  );
}
