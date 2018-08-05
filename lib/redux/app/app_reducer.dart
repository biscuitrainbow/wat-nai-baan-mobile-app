import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_reducers.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_reducer.dart';
import 'package:buddish_project/redux/user/user_reducer.dart';

AppState appReducer(AppState state, action) {
  var appState = new AppState(
    loginScreenState: loginScreenReducer(state.loginScreenState, action),
    sermonVideoScreenState: sermonVideoScreenReducer(state.sermonVideoScreenState, action),
    user: userReducer(state.user, action),
  );

  return appState;
}
