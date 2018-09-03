import 'dart:async';

import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/redux/activity/activity_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/ui/activity_compose/activity_composer_screen.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ActivityComposeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: ActivityComposerViewModel.fromStore,
      builder: (BuildContext context, ActivityComposerViewModel viewModel) {
        return ActivityComposeScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}

class ActivityComposerViewModel {
  final Function(Activity activity, BuildContext context) onSave;

  ActivityComposerViewModel({
    this.onSave,
  });

  static ActivityComposerViewModel fromStore(Store<AppState> store) {
    return ActivityComposerViewModel(onSave: (Activity activity, BuildContext context) {
      Completer<Null> completer = Completer();
      completer.future.then((_) {
        showToast("บันทึกกิจกรรมแล้ว");
        Navigator.of(context).pop();
      });

      store.dispatch(AddActivity(activity, completer));
    });
  }
}
