import 'dart:async';

import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/redux/app/app_middleware.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/app/app_reducer.dart';
import 'package:buddish_project/redux/user/user_middleware.dart';
import 'package:buddish_project/redux/video/video_middleware.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  var sharedPreferencesRepository = SharedPreferencesRepository();
  var userRepository = UserRepository();
  var youtubeRepository = YoutubeRepository();

  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..addAll(createAppMiddleware(userRepository, sharedPreferencesRepository))
      ..addAll(createUserMiddlewares(userRepository, sharedPreferencesRepository))
      ..addAll(createVideoMiddleware(youtubeRepository))
  );
}
