import 'package:buddish_project/redux/activity/activity_reducer.dart';
import 'package:buddish_project/redux/app/app_action.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/mantra/mantra_reducer.dart';
import 'package:buddish_project/redux/news/news_reducer.dart';
import 'package:buddish_project/redux/token/token_reducers.dart';
import 'package:buddish_project/redux/ui/activity_list_screen/activity_list_screen_reducers.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_reducers.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_reducers.dart';
import 'package:buddish_project/redux/ui/news_list_screen/news_list_screen_reducers.dart';
import 'package:buddish_project/redux/ui/news_screen/news_screen_reducers.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_reducers.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_reducer.dart';
import 'package:buddish_project/redux/user/user_reducer.dart';

AppState appReducer(AppState state, action) {
  if (action is ClearAppState) {
    return AppState.initial();
  }

  var appState = AppState(
    user: userReducer(state.user, action),
    token: tokenReducers(state.token, action),
    news: newsReducers(state.news, action),
    activities: activityReducers(state.activities, action),
    mantras: mantrasReducers(state.mantras, action),
    loginScreenState: loginScreenReducer(state.loginScreenState, action),
    sermonVideoScreenState: sermonVideoScreenReducer(state.sermonVideoScreenState, action),
    profileScreenState: profileScreenReducers(state.profileScreenState, action),
    newsComposeScreenState: newsComposeReducers(state.newsComposeScreenState, action),
    newsListScreenState: newsListReducers(state.newsListScreenState, action),
    activityListScreenState: activityListReducers(state.activityListScreenState, action),
    newsScreenState: newsScreenReducers(state.newsScreenState, action),
  );

  return appState;
}
