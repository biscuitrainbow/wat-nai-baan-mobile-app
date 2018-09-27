import 'dart:async';

import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/ui/news_screen/news_screen_state.dart';
import 'package:buddish_project/ui/common/loading_dialog.dart';
import 'package:buddish_project/ui/news/news_screen.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NewsContainer extends StatelessWidget {
  final News news;

  NewsContainer({
    @required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: NewsViewModel.fromStore,
      builder: (BuildContext context, NewsViewModel viewModel) {
        return NewsScreen(
          news: news,
          viewModel: viewModel,
        );
      },
    );
  }
}

class NewsViewModel {
  final NewsScreenState state;
  final Function(int, BuildContext context) onDelete;
  final User user;

  NewsViewModel({
    this.state,
    this.onDelete,
    this.user,
  });

  static NewsViewModel fromStore(Store<AppState> store) {
    return NewsViewModel(
      state: store.state.newsScreenState,
      onDelete: (int newsId, BuildContext context) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return LoadingDialog(title: 'กำลังลบข่าวสาร');
          },
        );

        Completer<Null> completer = Completer();
        completer.future.then((_) {
          Navigator.of(context).pop();
          showToast("ลบข่าวสารแล้ว");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });

        store.dispatch(DeleteNews(newsId, completer));
      },
      user: store.state.user,
    );
  }
}
