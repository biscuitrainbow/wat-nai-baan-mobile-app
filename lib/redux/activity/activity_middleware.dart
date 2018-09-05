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
    TypedMiddleware<AppState, UpdateActivity>(
      _updateActivity(activityRepository),
    ),
    TypedMiddleware<AppState, DeleteActivity>(
      _deleteActivity(activityRepository),
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

Middleware<AppState> _updateActivity(
  ActivityRepository activityRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is UpdateActivity) {
      try {
        final token = store.state.token;
        await activityRepository.updateActivity(token, action.activity);

        action.completer?.complete(null);
        next(FetchActivities());
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}

Middleware<AppState> _deleteActivity(
  ActivityRepository activityRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is DeleteActivity) {
      try {
        final token = store.state.token;
        await activityRepository.deleteActivity(token, action.activityId);

        action.completer?.complete(null);
        next(FetchActivities());
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}
