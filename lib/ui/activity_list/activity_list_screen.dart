import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/ui/activity_list/activity_item.dart';
import 'package:buddish_project/ui/activity_list/activity_list_container.dart';
import 'package:flutter/material.dart';

class ActivityListScreen extends StatefulWidget {
  static final String route = 'activityList';

  final ActivityListViewModel viewModel;

  ActivityListScreen({
    this.viewModel,
  });

  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  Widget _buildTotalPointCard() {
    final int totalPoint = widget.viewModel.activities.fold(0, (int prev, Activity element) => prev + element.point);

    final point = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            totalPoint.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.main, fontSize: 45.0),
          ),
          SizedBox(width: 8.0),
          Text(
            "แต้ม",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.main, fontSize: 20.0),
          ),
        ],
      ),
    );

    final background = Container(
      height: 60.0,
      color: Colors.yellow,
    );

    final description = Text(
      'แต้มบุญสะสม',
      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 18.0),
    );

    final scoreCard = Container(
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.screenHorizonPadding,
        vertical: Dimension.screenVerticalPadding,
      ),
      margin: EdgeInsets.only(
        bottom: Dimension.fieldVerticalMargin,
        left: Dimension.screenHorizonPadding,
        right: Dimension.screenHorizonPadding,
      ),
      child: Column(
        children: <Widget>[
          point,
          description,
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        background,
        scoreCard,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final listContent = [
      _buildTotalPointCard(),
      SizedBox(height: 16.0),
    ];

    final activityCards = widget.viewModel.activities.map((Activity activity) => ActivityItem(activity: activity)).toList();
    listContent.addAll(activityCards);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('กิจกรรมสะสมแต้มบุญ', style: AppStyle.appbarTitle),
        iconTheme: IconThemeData(color: AppColors.main),
      ),
      backgroundColor: Colors.grey.shade50,
      body: Container(
        child: ListView(children: listContent),
      ),
    );
  }
}
