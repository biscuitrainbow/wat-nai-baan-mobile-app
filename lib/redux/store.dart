import 'dart:async';

import 'package:audioplayer/audioplayer.dart';
import 'package:buddish_project/data/repository/activity_repository.dart';
import 'package:buddish_project/data/repository/news_repository.dart';
import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/survey_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/redux/activity/activity_middleware.dart';
import 'package:buddish_project/redux/app/app_middleware.dart';
import 'package:buddish_project/redux/app/app_reducer.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/mantra/mantra_middleware.dart';
import 'package:buddish_project/redux/news/news_middleware.dart';
import 'package:buddish_project/redux/notification/notification_middleware.dart';
import 'package:buddish_project/redux/survey/survey_middleware.dart';
import 'package:buddish_project/redux/user/user_middleware.dart';
import 'package:buddish_project/redux/video/video_middleware.dart';
import 'package:buddish_project/service/audio_service.dart';
import 'package:buddish_project/service/notification_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

Future<Store<AppState>> createStore() async {
  final dio = Dio();

  final sharedPreferencesRepository = SharedPreferencesRepository();
  final userRepository = UserRepository();
  final youtubeRepository = YoutubeRepository();
  final newsRepository = NewsRepository();
  final activityRepository = ActivityRepository();
  final surveyRepository = SurveyRepository(dio);

  final audioPlugin = AudioPlayer();
  final audioService = AudioService(audioPlugin);

  final firebaseMessaging = FirebaseMessaging();
  final notificationService = NotificationService(firebaseMessaging);

  return Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: []
        ..add(LoggingMiddleware.printer())
        ..addAll(createAppMiddleware(userRepository, notificationService, sharedPreferencesRepository))
        ..addAll(createUserMiddleware(userRepository, sharedPreferencesRepository))
        ..addAll(createNewsMiddleware(newsRepository, notificationService))
        ..addAll(createNotificationMiddleware(notificationService))
        ..addAll(createVideoMiddleware(youtubeRepository))
        ..addAll(createActivityMiddleware(activityRepository))
        ..addAll(createVideoMiddleware(youtubeRepository))
        ..addAll(createMantraMiddleware(audioService))
        ..addAll(createSurveyMiddleware(surveyRepository)));
}
