import 'dart:async';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/data/repository/news_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/notification/notification_action.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_action.dart';
import 'package:buddish_project/redux/ui/news_list_screen/news_list_screen_action.dart';
import 'package:buddish_project/redux/ui/news_screen/news_screen_action.dart';
import 'package:buddish_project/service/notification_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createNewsMiddleware(
  NewsRepository newsRepository,
  NotificationService notificationService,
) {
  return [
    TypedMiddleware<AppState, AddNews>(
      _addNews(newsRepository, notificationService),
    ),
    TypedMiddleware<AppState, UpdateNews>(
      _updateNews(newsRepository),
    ),
    TypedMiddleware<AppState, DeleteNews>(
      _deleteNews(newsRepository),
    ),
    TypedMiddleware<AppState, FetchNews>(
      _fetchNews(newsRepository),
    ),
  ];
}

Middleware<AppState> _addNews(
  NewsRepository newsRepository,
  NotificationService notificationService,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is AddNews) {
      next(ShowNewsComposeLoading());

      try {
        final token = store.state.token;
        await newsRepository.addNews(token, action.news);

        action.completer.complete(null);

        next(BroadcastTopic('แจ้งเตือนข่าวสาร', action.news.title, Environment.notificationTopic));
        next(FetchNews());
      } catch (error) {
        print(error);
      }

      next(HideNewsComposeLoading());
      next(action);
    }
  };
}

Middleware<AppState> _updateNews(
  NewsRepository newsRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is UpdateNews) {
      next(ShowNewsComposeLoading());

      try {
        final token = store.state.token;
        await newsRepository.update(token, action.news);

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

Middleware<AppState> _deleteNews(
  NewsRepository newsRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is DeleteNews) {
      next(ShowNewsLoading());

      try {
        final token = store.state.token;
        await Future.delayed(Duration(seconds: 1));
        await newsRepository.delete(token, action.newsId);

        action.completer.complete(null);
        next(FetchNews());
      } catch (error) {
        print(error);
      }

      next(HideNewsLoading());
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
