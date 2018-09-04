import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/ui/news_compose/news_compose_screen.dart';
import 'package:buddish_project/ui/news_compose/news_compose_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NewsEditContainer extends StatelessWidget {
  final News news;

  NewsEditContainer({
    @required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: NewsComposeViewModel.fromStore,
      builder: (BuildContext context, NewsComposeViewModel viewModel) {
        return NewsComposeScreen(
          viewModel: viewModel,
          news: news,
          isEditing: true,
        );
      },
    );
  }
}
