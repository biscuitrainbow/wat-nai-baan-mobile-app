import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_action.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_action.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_state.dart';
import 'package:buddish_project/redux/video/video_action.dart';
import 'package:redux/redux.dart';

final sermonVideoScreenReducer = combineReducers<SermonVideoScreenState>([
  new TypedReducer<SermonVideoScreenState, ShowSermonLoading>(_showLoginLoading),
  new TypedReducer<SermonVideoScreenState, HideSermonLoading>(_successLoading),
  new TypedReducer<SermonVideoScreenState, FetchSermonPlaylistSuccess>(_fetchSermonPlaylistSuccess),
  new TypedReducer<SermonVideoScreenState, ResetState>(_resetState),
]);

SermonVideoScreenState _showLoginLoading(
  SermonVideoScreenState state,
  ShowSermonLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

SermonVideoScreenState _successLoading(
  SermonVideoScreenState state,
  HideSermonLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}

SermonVideoScreenState _fetchSermonPlaylistSuccess(
  SermonVideoScreenState state,
  FetchSermonPlaylistSuccess action,
) {
  return state.copyWith(videos: action.videos);
}

SermonVideoScreenState _resetState(
  SermonVideoScreenState state,
  ResetState action,
) {
  return SermonVideoScreenState.initial();
}
