import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;
  final Function onEditPressed;
  final Function onDeletePressed;

  ActivityItem({
    @required this.activity,
    @required this.onDeletePressed,
    @required this.onEditPressed,
  });

  Widget _buildCategories(String tag) {
    return Row(
      children: <Widget>[
        Chip(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
          backgroundColor: AppColors.secondary,
          label: Text(
            tag,
            style: TextStyle(color: AppColors.primary, fontSize: 12.0, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(width: 4.0),
      ],
    );
  }

  Widget _buildPoint() {
    return Container(
      width: 80.0,
      height: double.infinity,
      color: AppColors.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            activity.point.toString(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 40.0,
            ),
          ),
          Text(
            "แต้ม",
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildActionDialog(Activity activity) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 16.0),
      title: Text(
        'คำสั่งเพิ่มเติม',
        style: TextStyle(color: AppColors.primary),
      ),
      children: <Widget>[
        SimpleDialogOption(
          child: Text('แก้ไข'),
          onPressed: onEditPressed,
        ),
        SizedBox(height: 8.0),
        SimpleDialogOption(
          child: Text('ลบ'),
          onPressed: onDeletePressed,
        )
      ],
    );
  }

  Widget _buildDetail(BuildContext context) {
    final actions = IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildActionDialog(activity),
        );
      },
    );

    final detail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          toThaiDate(activity.datetime),
          style: TextStyle(color: Colors.black54),
        ),
        Text(
          activity.title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: AppColors.primary),
        ),
        Row(
          children: activity.tags.map((String tag) => _buildCategories(tag)).toList(),
        )
      ],
    );

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            detail,
            actions,
          ],
        ),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPoint(),
          _buildDetail(context),
        ],
      ),
    );
  }
}
