import 'dart:async';

import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/redux/activity/activity_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/ui/activity_list/activity_list_screen.dart';
import 'package:buddish_project/ui/common/loading_dialog.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ActivityListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: ActivityListViewModel.fromStore,
      onInit: (Store<AppState> store) => store.dispatch(FetchActivities()),
      builder: (BuildContext context, ActivityListViewModel viewModel) {
        return ActivityListScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}

class ActivityListViewModel {
  final List<Activity> activities;
  final Function(BuildContext context, int activityId) onDelete;

  ActivityListViewModel({
    @required this.activities,
    @required this.onDelete,
  });

  static ActivityListViewModel fromStore(Store<AppState> store) {
    return ActivityListViewModel(
        activities: store.state.activities,
        onDelete: (BuildContext context, int activityId) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return LoadingDialog(title: 'กำลังลบข่าวสาร');
            },
          );

          Completer<Null> completer = Completer();
          completer.future.then((_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            showToast("ลบกิจกรรมแล้ว");
          });

          store.dispatch(DeleteActivity(activityId, completer));
        });
  }
}
