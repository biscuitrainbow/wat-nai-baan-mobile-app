import 'dart:convert';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/news_compose/news_compose_container.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class NewsComposeScreen extends StatefulWidget {
  static final String route = '/newCompose';

  final NewsComposeViewModel viewModel;

  NewsComposeScreen({
    this.viewModel,
  });

  @override
  _NewsComposeScreenState createState() => _NewsComposeScreenState();
}

class _NewsComposeScreenState extends State<NewsComposeScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;

  void _save() {
    final encoded = json.encode(_controller.document.toJson());

    final news = News(
      title: News.getRandomTitle(),
      content: encoded,
      category: News.categoryGeneral,
      cover: News.getRandomImage(),
      dateCreated: DateTime.now(),
      dueDate: DateTime.now(),
    );

    widget.viewModel.onSave(news, context);
  }

  @override
  void initState() {
    final document = NotusDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('สร้างข่าวสาร', style: AppStyle.appbarTitle),
        iconTheme: IconThemeData(color: AppColors.main),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: _save,
          ),
        ],
      ),
      body: LoadingView(
        loadingStatus: widget.viewModel.state.loadingStatus,
        loadingContent: LoadingContent(text: 'กำลังบันทึก'),
        initialContent: Container(
          child: ZefyrEditor(
            autofocus: true,
            enabled: true,
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
      ),
    );
  }
}
