import 'dart:async';

import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_action.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createUserMiddlewares(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return [
    new TypedMiddleware<AppState, Login>(
      _login(userRepository, sharedPrefRepository),
    ),
  ];
}

Middleware<AppState> _login(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is Login) {
      try {
        next(ShowLoginLoading());

        User user = await userRepository.login(action.email, action.password);
        await Future.delayed(Duration(seconds: 1));

        action.completer.complete(user.name);
        next(LoginSuccess(user));
        next(HideLoginLoading());
      } catch (error) {
        next(HideLoginLoading());
        action.completer.completeError(error);
      }

      next(action);
    }
  };
}
