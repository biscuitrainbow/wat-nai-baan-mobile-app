import 'dart:async';

import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_state.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class NewsComposeViewModel {
  final Function(News, BuildContext) onCreate;
  final Function(News, BuildContext) onUpdate;

  final Function onUploadImage;
  final NewsComposeScreenState state;

  NewsComposeViewModel({
    @required this.onUpdate,
    @required this.onCreate,
    @required this.onUploadImage,
    @required this.state,
  });

  static NewsComposeViewModel fromStore(Store<AppState> store) {
    return NewsComposeViewModel(
      onCreate: (News news, BuildContext context) {
        Completer<Null> completer = Completer();
        completer.future.then((_) {
          showToast("ข่าวสารเผยแพร่แล้ว");
          Navigator.of(context).pop();
        });

        store.dispatch(AddNews(news, completer));
      },
      onUpdate: (News news, BuildContext context) {
        Completer<Null> completer = Completer();
        completer.future.then((_) {
          showToast("บันทึกข่าวสารแล้ว");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });

        store.dispatch(UpdateNews(news, completer));
      },
      state: store.state.newsComposeScreenState,
      onUploadImage: () {},
    );
  }
}
