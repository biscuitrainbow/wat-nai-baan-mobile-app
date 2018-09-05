import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/redux/activity/activity_action.dart';
import 'package:buddish_project/redux/app/app_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/token/token_action.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/service/notification_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAppMiddleware(
  UserRepository userRepository,
  NotificationService notificationService,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return [
     TypedMiddleware<AppState, Init>(
      init(userRepository, notificationService, sharedPrefRepository),
    ),
  ];
}

Middleware<AppState> init(
  UserRepository userRepository,
  NotificationService notificationService,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is Init) {
      try {
        final String token = await sharedPrefRepository.getToken();

        if (token != null) {
          next(SaveToken(token));
          next(FetchUserDetail());
          next(FetchNews());
          next(FetchActivities());

          notificationService.initPushNotification();
        }
      } catch (error) {}

      next(action);
    }
  };
}
