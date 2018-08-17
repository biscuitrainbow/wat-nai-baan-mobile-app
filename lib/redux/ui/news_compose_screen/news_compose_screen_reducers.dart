import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_action.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_state.dart';
import 'package:redux/redux.dart';

final newsComposeReducers = combineReducers<NewsComposeScreenState>([
  new TypedReducer<NewsComposeScreenState, ShowNewsComposeLoading>(_showLoginLoading),
  new TypedReducer<NewsComposeScreenState, HideNewsComposeLoading>(_successLoading),
]);

NewsComposeScreenState _showLoginLoading(
  NewsComposeScreenState state,
  ShowNewsComposeLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

NewsComposeScreenState _successLoading(
  NewsComposeScreenState state,
  HideNewsComposeLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}
