import 'dart:async';

import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/redux/app/app_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/token/token_action.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_action.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAppMiddleware(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return [
    new TypedMiddleware<AppState, Init>(
      init(userRepository, sharedPrefRepository),
    ),
  ];
}

Middleware<AppState> init(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is Init) {
      try {
        final String token = await sharedPrefRepository.getToken();
        next(SaveToken(token));
      } catch (error) {

      }

      next(action);
    }
  };
}
