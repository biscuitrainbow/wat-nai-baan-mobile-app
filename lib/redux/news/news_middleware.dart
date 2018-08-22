import 'package:buddish_project/data/repository/news_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_action.dart';
import 'package:buddish_project/redux/ui/news_list_screen/news_list_screen_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createNewsMiddleware(
  NewsRepository newsRepository,
) {
  return [
    new TypedMiddleware<AppState, AddNews>(
      _addNews(newsRepository),
    ),
    new TypedMiddleware<AppState, FetchNews>(
      _fetchNews(newsRepository),
    ),
  ];
}

Middleware<AppState> _addNews(
  NewsRepository newsRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is AddNews) {
      next(ShowNewsComposeLoading());

      try {
        final token = store.state.token;
        await newsRepository.addNews(token, action.news);

        action.completer.complete(null);
        next(FetchNews());
      } catch (error) {
        print(error);
      }

      next(HideNewsComposeLoading());
      next(action);
    }
  };
}

Middleware<AppState> _fetchNews(
  NewsRepository newsRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchNews) {
      next(ShowNewsListLoading());

      try {
        final token = store.state.token;
        final news = await newsRepository.fetchNews(token);

        action.completer?.complete(null);
        next(FetchNewsSuccess(news));
      } catch (error) {
        print(error);
      }

      next(HideNewsListLoading());
      next(action);
    }
  };
}
