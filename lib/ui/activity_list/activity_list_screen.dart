import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/ui/activity_compose/activity_composer_screen.dart';
import 'package:buddish_project/ui/activity_compose/activity_edit_container.dart';
import 'package:buddish_project/ui/activity_list/activity_item.dart';
import 'package:buddish_project/ui/activity_list/activity_list_container.dart';
import 'package:buddish_project/ui/common/confirm_dialog.dart';
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
            style: TextStyle(color: AppColors.primary, fontSize: 45.0),
          ),
          SizedBox(width: 8.0),
          Text(
            "แต้ม",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primary, fontSize: 20.0),
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
      height: 135.0,
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

  void _showActivityComposer() {
    Navigator.of(context).pushNamed(ActivityComposeScreen.route);
  }

  void _showEditActivity(Activity activity) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ActivityEditContainer(activity: activity)));
  }

  void _delete(BuildContext context, Activity activity) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: 'ต้องการลบหรือไม่',
            description: 'กิจกรรมจะหายไปและไม่สามารถกู้คืนได้',
            confirmText: 'ลบ',
            cancelText: 'ยกเลิก',
            onCancel: () {
              Navigator.of(context).pop();
            },
            onConfirm: () {
              widget.viewModel.onDelete(context, activity.id);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final listContent = [
      _buildTotalPointCard(),
      SizedBox(height: 16.0),
    ];

    final activityCards = widget.viewModel.activities
        .map(
          (Activity activity) => ActivityItem(
                activity: activity,
                onEditPressed: () => _showEditActivity(activity),
                onDeletePressed: () => _delete(context, activity),
              ),
        )
        .toList();
    listContent.addAll(activityCards);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('กิจกรรมสะสมแต้มบุญ', style: AppStyle.appbarTitle),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1.0,
        onPressed: () => _showActivityComposer(),
        child: Icon(
          Icons.add,
          color: AppColors.primary,
        ),
      ),
      backgroundColor: Colors.grey.shade50,
      body: Container(
        child: ListView(children: listContent),
      ),
    );
  }
}
