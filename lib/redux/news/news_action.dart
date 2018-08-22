import 'dart:async';

import 'package:buddish_project/data/model/news.dart';

class FetchNewsSuccess {
  final List<News> news;

  FetchNewsSuccess(this.news);
}

class FetchNews {
  final Completer<Null> completer;

  FetchNews({this.completer});
}

class AddNews {
  final News news;
  final Completer<Null> completer;

  AddNews(this.news, this.completer);
}
