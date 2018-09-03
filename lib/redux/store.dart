import 'dart:async';

import 'package:buddish_project/data/repository/activity_repository.dart';
import 'package:buddish_project/data/repository/news_repository.dart';
import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/redux/activity/activity_middleware.dart';
import 'package:buddish_project/redux/app/app_middleware.dart';
import 'package:buddish_project/redux/app/app_reducer.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_middleware.dart';
import 'package:buddish_project/redux/user/user_middleware.dart';
import 'package:buddish_project/redux/video/video_middleware.dart';
import 'package:buddish_project/service/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

Future<Store<AppState>> createStore() async {
  final sharedPreferencesRepository = SharedPreferencesRepository();
  final userRepository = UserRepository();
  final youtubeRepository = YoutubeRepository();
  final newsRepository = NewsRepository();
  final activityRepository = ActivityRepository();

  final firebaseMesseging = FirebaseMessaging();
  final notificationService = NotificationService(firebaseMesseging);

  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..add(LoggingMiddleware.printer())
      ..addAll(createAppMiddleware(userRepository, notificationService, sharedPreferencesRepository))
      ..addAll(createUserMiddleware(userRepository, sharedPreferencesRepository))
      ..addAll(createNewsMiddleware(newsRepository, notificationService))
      ..addAll(createVideoMiddleware(youtubeRepository))
      ..addAll(createActivityMiddleware(activityRepository)),
  );
}
