import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/news_list_screen/news_list_screen_action.dart';
import 'package:buddish_project/redux/ui/news_list_screen/news_list_screen_state.dart';
import 'package:redux/redux.dart';

final newsListReducers = combineReducers<NewsListScreenState>([
  new TypedReducer<NewsListScreenState, ShowNewsListLoading>(_showNewsListLoading),
  new TypedReducer<NewsListScreenState, HideNewsListLoading>(_successNewsListLoading),
]);

NewsListScreenState _showNewsListLoading(
  NewsListScreenState state,
  ShowNewsListLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

NewsListScreenState _successNewsListLoading(
  NewsListScreenState state,
  HideNewsListLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}
