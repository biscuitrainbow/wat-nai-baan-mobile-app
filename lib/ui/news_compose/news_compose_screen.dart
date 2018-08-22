import 'dart:convert';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/delegate/firebase_image_delegate.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/news_compose/news_compose_container.dart';
import 'package:buddish_project/utils/news_compose_util.dart';
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
  final _formKey = GlobalKey<FormState>();

  ZefyrController _controller;
  TextEditingController _titleController;
  FocusNode _focusNode;
  FirebaseImageDelegate _imageDelegate;

  void _save() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final encoded = json.encode(_controller.document.toJson());
    final cover = getFirstImage(_controller.document);

    final news = News(
      title: _titleController.text,
      content: encoded,
      category: News.categoryGeneral,
      cover: cover ?? '',
      dateCreated: DateTime.now(),
      dueDate: DateTime.now(),
    );

    widget.viewModel.onSave(news, context);
  }

  @override
  void initState() {
    _titleController = TextEditingController();

    final document = NotusDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();

    _imageDelegate = FirebaseImageDelegate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: Dimension.screenHorizonPadding, right: Dimension.screenHorizonPadding, top: Dimension.screenVerticalPadding),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 24.0),
                    validator: (String value) => value.isEmpty ? 'กรุณากรอกชื่อเรื่อง' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration.collapsed(hintText: 'ชื่อเรื่อง'),
                    onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_focusNode),
                  ),
                ),
              ),
              Expanded(
                child: ZefyrEditor(
                  autofocus: true,
                  enabled: true,
                  controller: _controller,
                  focusNode: _focusNode,
                  imageDelegate: _imageDelegate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
