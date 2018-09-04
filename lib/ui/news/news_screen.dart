import 'dart:convert';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/delegate/firebase_image_delegate.dart';
import 'package:buddish_project/ui/common/confirm_dialog.dart';
import 'package:buddish_project/ui/news/news_container.dart';
import 'package:buddish_project/ui/news_compose/news_edit_container.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class NewsScreen extends StatefulWidget {
  static final String route = '/news';

  final News news;
  final NewsViewModel viewModel;

  NewsScreen({
    this.news,
    this.viewModel,
  });

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;
  FirebaseImageDelegate _firebaseImageDelegate;

  void _showEditNews(News news) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => NewsEditContainer(news: widget.news)));
  }

  void _delete(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: 'ต้องการลบหรือไม่',
            description: 'ข่าวสารจะหายไปและไม่สามารถกู้คืนได้',
            confirmText: 'ลบ',
            cancelText: 'ยกเลิก',
            onCancel: () {
              Navigator.of(context).pop();
            },
            onConfirm: () {
              widget.viewModel.onDelete(widget.news.id, context);
            },
          );
        });
  }

  @override
  void initState() {
    final document = NotusDocument.fromJson(json.decode(widget.news.content));
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
    _firebaseImageDelegate = FirebaseImageDelegate();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('ข่าวสาร', style: AppStyle.appbarTitle),
        iconTheme: IconThemeData(color: AppColors.primary),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mode_edit),
            onPressed: () => _showEditNews(widget.news),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _delete(context),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ZefyrEditor(
              focusNode: _focusNode,
              enabled: false,
              controller: _controller,
              imageDelegate: _firebaseImageDelegate,
            ),
          )
        ],
      ),
    );
  }
}
