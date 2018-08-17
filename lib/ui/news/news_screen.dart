import 'dart:convert';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class NewsScreen extends StatefulWidget {
  static final String route = '/news';

  final News news;

  const NewsScreen({this.news});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    final document = NotusDocument.fromJson(json.decode(widget.news.content));

    _focusNode = FocusNode();
    _controller = ZefyrController(document);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข่าวสาร',
          style: AppStyle.appbarTitle,
        ),
        elevation: 1.0,
        iconTheme: IconThemeData(color: AppColors.main),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ZefyrEditor(
              focusNode: _focusNode,
              enabled: false,
              controller: _controller,
            ),
          )
        ],
      ),
    );
  }
}
