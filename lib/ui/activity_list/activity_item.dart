import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  ActivityItem({
    @required this.activity,
  });

  Widget _buildChip(String tag) {
    return Row(
      children: <Widget>[
        Chip(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
          backgroundColor: AppColors.secondary,
          label: Text(
            tag,
            style: TextStyle(color: AppColors.main, fontSize: 12.0, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(width: 4.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimension.screenVerticalPadding),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      height: 110.0,
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: double.infinity,
            color: AppColors.secondary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  activity.point.toString(),
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  "แต้ม",
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    toThaiDate(activity.datetime),
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    activity.title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: AppColors.main),
                  ),
                  Row(
                    children: activity.tags.map((String tag) => _buildChip(tag)).toList(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
