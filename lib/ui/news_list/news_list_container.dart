import 'dart:async';

import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/ui/news_list_screen/news_list_screen_state.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NewsListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: NewsListViewModel.fromStore,
      onDispose: (Store<AppState> store) {},
      builder: (BuildContext context, NewsListViewModel viewModel) {
        print(viewModel.user);

        return NewsListScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}

class NewsListViewModel {
  final List<News> news;
  final List<News> generalNews;
  final List<News> activityNews;
  final User user;

  final NewsListScreenState state;
  final Function(RefreshIndicatorState refresherIndicatorState, Completer<Null> completer) onRefresh;

  NewsListViewModel({
    @required this.news,
    @required this.generalNews,
    @required this.activityNews,
    @required this.state,
    @required this.onRefresh,
    @required this.user,
  });

  static NewsListViewModel fromStore(Store<AppState> store) {
    return NewsListViewModel(
      news: store.state.news,
      generalNews: store.state.news.where((news) => news.category == News.categoryGeneral).toList(),
      activityNews: store.state.news.where((news) => news.category == News.categoryActivity).toList(),
      state: store.state.newsListScreenState,
      onRefresh: (RefreshIndicatorState refresherIndicatorState, Completer<Null> completer) {
        store.dispatch(FetchNews(completer: completer));
      },
      user: store.state.user,
    );
  }
}
