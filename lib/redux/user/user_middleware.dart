import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/data/repository/prefs_repository.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/token/token_action.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_action.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_action.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createUserMiddleware(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return [
    TypedMiddleware<AppState, Login>(_login(userRepository, sharedPrefRepository)),
    TypedMiddleware<AppState, Logout>(_logout(userRepository, sharedPrefRepository)),
    TypedMiddleware<AppState, UpdateUser>(_update(userRepository)),
    TypedMiddleware<AppState, FetchUserDetail>(_fetchUser(userRepository)),
  ];
}

Middleware<AppState> _login(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is Login) {
      next(ShowLoginLoading());

      try {
        User user = await userRepository.login(action.email, action.password);
        await sharedPrefRepository.saveToken(user.token);

        action.completer.complete(null);

        next(SaveToken(user.token));
        next(LoginSuccess(user));
        next(HideLoginLoading());
      } catch (error) {
        action.completer.completeError(error);
        next(HideLoginLoading());
      }

      next(action);
    }
  };
}

Middleware<AppState> _logout(
  UserRepository userRepository,
  SharedPreferencesRepository sharedPrefRepository,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is Logout) {
      try {
        await sharedPrefRepository.deleteToken();
        next(DeleteToken());
      } catch (error) {}

      next(action);
    }
  };
}

Middleware<AppState> _fetchUser(
  UserRepository userRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchUserDetail) {
      try {
        final token = store.state.token;
        final user = await userRepository.fetchUser(token);

        next(LoginSuccess(user));
      } catch (error) {}

      next(action);
    }
  };
}

Middleware<AppState> _update(
  UserRepository userRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is UpdateUser) {
      next(ShowProfileLoading());

      try {
        final token = store.state.token;
        await userRepository.update(token, action.user);
        next(FetchUserDetail());
        action.completer.complete(null);
      } catch (error) {
        print(error);
      }

      next(HideProfileLoading());
      next(action);
    }
  };
}
