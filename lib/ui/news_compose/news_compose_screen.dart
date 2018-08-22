import 'dart:convert';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/delegate/firebase_image_delegate.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_dialog.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/common/radio_item.dart';
import 'package:buddish_project/ui/news_compose/news_compose_container.dart';
import 'package:buddish_project/utils/news_compose_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  TextEditingController _locationController;
  TextEditingController _datetimeController;

  DateTime _datetime;

  FocusNode _editorFocusNode;
  FocusNode _locationFocusNode;
  FocusNode _datetimeFocusNode;

  FirebaseImageDelegate _imageDelegate;
  String category;

  void _save() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final encoded = json.encode(_controller.document.toJson());
    final cover = getFirstImage(_controller.document);

    final news = News(
      title: _titleController.text,
      content: encoded,
      category: category,
      cover: cover ?? '',
      dateCreated: DateTime.now(),
      dueDate: _datetime ?? DateTime.now(),
      location: _locationController.text ?? '',
    );

    widget.viewModel.onSave(news, context);
  }

  void _onStartUpload() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoadingDialog(title: 'กำลังอัพโหลดรูปภาพ');
      },
    );
  }

  void _onCompleteUpload() {
    Navigator.of(context).pop();
  }

  Widget _buildCategoryField() {
    final label = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        'ประเภท',
        style: TextStyle(color: Colors.black54, fontSize: 12.0),
      ),
    );

    final radios = Row(
      children: <Widget>[
        RadioItem(
          value: News.categoryGeneral,
          label: News.categoryGeneralTH,
          groupValue: category,
          onChanged: (String value) {
            setState(() => category = value);
          },
        ),
        RadioItem(
          value: News.categoryActivity,
          label: News.categoryActivityTH,
          groupValue: category,
          onChanged: (String value) {
            setState(() => category = value);
          },
        )
      ],
    );

    return Container(
      padding: EdgeInsets.only(top: 8.0),
//      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label,
          radios,
        ],
      ),
    );
  }

  void _onDatetimeFocused() async {
    try {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: new DateTime(2101),
      );

      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null && pickedDate != null) {
        final datetime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _datetime = datetime;
        });

        final formatter = DateFormat(AppString.datetimeTextField);
        _datetimeController.text = formatter.format(datetime);
      }

      FocusScope.of(context).requestFocus(_editorFocusNode);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _titleController = TextEditingController();
    _locationController = TextEditingController();
    _datetimeController = TextEditingController();

    _locationFocusNode = FocusNode();
    _editorFocusNode = FocusNode();
    _datetimeFocusNode = FocusNode();

    _datetimeFocusNode.addListener(() async {
      if (_datetimeFocusNode.hasFocus) {
        _onDatetimeFocused();
      }
    });

    final document = NotusDocument();
    _controller = ZefyrController(document);

    _imageDelegate = FirebaseImageDelegate(
      onCompleteUpload: _onCompleteUpload,
      onStartUploading: _onStartUpload,
    );

    category = News.categoryGeneral;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputStyle = InputDecoration(
      border: InputBorder.none,
      labelStyle: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    );

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
      body: Builder(
        builder: (BuildContext context) {
          return LoadingView(
            loadingStatus: widget.viewModel.state.loadingStatus,
            loadingContent: LoadingContent(text: 'กำลังบันทึก'),
            initialContent: Container(
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _titleController,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 20.0),
                        validator: (String value) => value.isEmpty ? 'กรุณากรอกชื่อเรื่อง' : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration.collapsed(hintText: 'ชื่อเรื่อง'),
                        onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_datetimeFocusNode),
                      ),
                    ),
                    children: <Widget>[
                      _buildCategoryField(),
                      Offstage(
                        offstage: category == News.categoryGeneral,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
                          child: TextFormField(
                            focusNode: _datetimeFocusNode,
                            controller: _datetimeController,
                            keyboardType: TextInputType.text,
                            decoration: inputStyle.copyWith(
                              labelText: 'วัน-เวลา',
                              labelStyle: AppStyle.inputLabelStyle,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_locationFocusNode),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: category == News.categoryGeneral,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
                          child: TextFormField(
                            focusNode: _locationFocusNode,
                            controller: _locationController,
                            keyboardType: TextInputType.text,
                            decoration: inputStyle.copyWith(
                              labelText: 'สถานที่',
                              labelStyle: AppStyle.inputLabelStyle,
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_editorFocusNode),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ZefyrEditor(
                      autofocus: true,
                      enabled: true,
                      controller: _controller,
                      focusNode: _editorFocusNode,
                      imageDelegate: _imageDelegate,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
