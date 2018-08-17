import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:redux/redux.dart';

final newsReducers = combineReducers<List<News>>([
  new TypedReducer<List<News>, FetchNewsSuccess>(_fetchNewsSuccess),
//  new TypedReducer<List<News>, AddNews>(_addNews),
]);

List<News> _fetchNewsSuccess(
  List<News> state,
  FetchNewsSuccess action,
) {
  return action.news;
}

List<News> _addNews(
  List<News> state,
  AddNews action,
) {
  final news = List<News>.from(state)..add(action.news);

  return news;
}
