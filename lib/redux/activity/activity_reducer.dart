import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/redux/activity/activity_action.dart';
import 'package:redux/redux.dart';

final activityReducers = combineReducers<List<Activity>>([
  new TypedReducer<List<Activity>, FetchActivitiesSuccess>(_fetchActivitiesSuccess),
]);

List<Activity> _fetchActivitiesSuccess(
  List<Activity> state,
  FetchActivitiesSuccess action,
) {
  return action.activities;
}
