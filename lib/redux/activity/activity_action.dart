import 'dart:async';

import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/data/model/news.dart';

class FetchActivitiesSuccess {
  final List<Activity> activities;

  FetchActivitiesSuccess(this.activities);
}

class FetchActivities {
  final Completer<Null> completer;

  FetchActivities({this.completer});
}

class AddActivity {
  final News news;
  final Completer<Null> completer;

  AddActivity(this.news, this.completer);
}
