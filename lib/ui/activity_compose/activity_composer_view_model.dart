import 'dart:async';

import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/redux/activity/activity_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/ui/common/loading_dialog.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ActivityComposerViewModel {
  final Function(Activity activity, BuildContext context) onCreate;
  final Function(Activity activity, BuildContext context) onUpdate;

  ActivityComposerViewModel({
    @required this.onCreate,
    @required this.onUpdate,
  });

  static ActivityComposerViewModel fromStore(Store<AppState> store) {
    return ActivityComposerViewModel(
      onCreate: (Activity activity, BuildContext context) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return LoadingDialog(title: 'กำลังบันทึกกิจกรรม');
          },
        );

        Completer<Null> completer = Completer();
        completer.future.then((_) {
          showToast("สร้างกิจกรรมแล้ว");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });

        store.dispatch(AddActivity(activity, completer));
      },
      onUpdate: (Activity activity, BuildContext context) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return LoadingDialog(title: 'กำลังบันทึกกิจกรรม');
          },
        );

        Completer<Null> completer = Completer();
        completer.future.then((_) {
          showToast("บันทึกกิจกรรมแล้ว");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });

        store.dispatch(UpdateActivity(activity, completer));
      },
    );
  }
}
