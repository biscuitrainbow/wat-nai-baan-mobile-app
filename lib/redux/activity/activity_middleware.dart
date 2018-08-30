import 'package:buddish_project/data/repository/activity_repository.dart';
import 'package:buddish_project/redux/activity/activity_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createActivityMiddleware(
  ActivityRepository activityRepository,
) {
  return [
    TypedMiddleware<AppState, AddActivity>(
      _addActivity(activityRepository),
    ),
    TypedMiddleware<AppState, FetchActivities>(
      _fetchActivities(activityRepository),
    ),
  ];
}

Middleware<AppState> _addActivity(
  ActivityRepository activityRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is AddActivity) {
      try {
        final token = store.state.token;
        await activityRepository.addActivity(token, action.activity);

        action.completer.complete(null);
        next(FetchActivities());
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}

Middleware<AppState> _fetchActivities(
  ActivityRepository activityRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchActivities) {
      try {
        final token = store.state.token;
        final activities = await activityRepository.fetchActivities(token);

        action.completer?.complete(null);
        next(FetchActivitiesSuccess(activities));
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}
