import 'dart:async';

import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/news/news_action.dart';
import 'package:buddish_project/redux/ui/news_compose_screen/news_compose_screen_state.dart';
import 'package:buddish_project/ui/news_compose/news_compose_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

class NewsComposeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: NewsComposeViewModel.fromStore,
      builder: (BuildContext context, NewsComposeViewModel viewModel) {
        return NewsComposeScreen(viewModel: viewModel);
      },
    );
  }
}

class NewsComposeViewModel {
  final Function(News, BuildContext) onSave;
  final Function onUploadImage;
  final NewsComposeScreenState state;

  NewsComposeViewModel({
    @required this.onSave,
    @required this.onUploadImage,
    @required this.state,
  });

  static NewsComposeViewModel fromStore(Store<AppState> store) {
    return NewsComposeViewModel(
      onSave: (News news, BuildContext context) {
        Completer<Null> completer = Completer();
        completer.future.then((_) {
          Fluttertoast.showToast(msg: "ข่าวสารเผยแพร่แล้ว", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIos: 3, bgcolor: "#000000", textcolor: '#ffffff');

          Navigator.of(context).pop();
        });

        store.dispatch(AddNews(news, completer));
      },
      state: store.state.newsComposeScreenState,
      onUploadImage: () {

      },
    );
  }
}
