import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/news_screen/news_screen_action.dart';
import 'package:buddish_project/redux/ui/news_screen/news_screen_state.dart';
import 'package:redux/redux.dart';

final newsScreenReducers = combineReducers<NewsScreenState>([
  TypedReducer<NewsScreenState, ShowNewsLoading>(_showNewsLoading),
  TypedReducer<NewsScreenState, HideNewsLoading>(_successLoading),
]);

NewsScreenState _showNewsLoading(
  NewsScreenState state,
  ShowNewsLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

NewsScreenState _successLoading(
  NewsScreenState state,
  HideNewsLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}
