import 'dart:async';

import 'package:buddish_project/data/model/activity.dart';

class FetchActivitiesSuccess {
  final List<Activity> activities;

  FetchActivitiesSuccess(this.activities);
}

class FetchActivities {
  final Completer<Null> completer;

  FetchActivities({this.completer});
}

class AddActivity {
  final Activity activity;
  final Completer<Null> completer;

  AddActivity(this.activity, this.completer);
}

class UpdateActivity {
  final Activity activity;
  final Completer<Null> completer;

  UpdateActivity(this.activity, this.completer);
}

class DeleteActivity {
  final int activityId;
  final Completer<Null> completer;

  DeleteActivity(this.activityId, this.completer);
}
