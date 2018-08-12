import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/mantra/mantra_reducer.dart';
import 'package:buddish_project/redux/token/token_reducers.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_reducers.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_reducers.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_reducer.dart';
import 'package:buddish_project/redux/user/user_reducer.dart';

AppState appReducer(AppState state, action) {
  var appState = new AppState(
    user: userReducer(state.user, action),
    token: tokenReducers(state.token, action),
    loginScreenState: loginScreenReducer(state.loginScreenState, action),
    sermonVideoScreenState: sermonVideoScreenReducer(state.sermonVideoScreenState, action),
    mantras: mantrasReducers(state.mantras, action),
    profileScreenState: profileScreenReducers(state.profileScreenState, action),
  );

  return appState;
}
