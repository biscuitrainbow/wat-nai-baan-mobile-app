import 'dart:convert';

import 'package:buddish_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class NewsComposeScreen extends StatefulWidget {
  static final String route = 'newCompose';

  @override
  _NewsComposeScreenState createState() => _NewsComposeScreenState();
}

class _NewsComposeScreenState extends State<NewsComposeScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;

  void _save() {
    print(json.encode(_controller.document.toJson()));
  }

  @override
  void initState() {
    final document = NotusDocument.fromJson([
      {"insert": "ราทำไมไม่ทำให้\n4844840"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "9584595"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "5985959"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "ราทำไมไม่ทำให้\n4844840"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "9584595"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "5985959"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "ราทำไมไม่ทำให้\n4844840"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "9584595"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "5985959"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "ราทำไมไม่ทำให้\n4844840"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "9584595"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      },
      {"insert": "5985959"},
      {
        "insert": "\n",
        "attributes": {"block": "ul"}
      }
    ]);
    _controller = ZefyrController(document);
    _focusNode = FocusNode();

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
            icon: Icon(Icons.save),
            onPressed: _save,
          ),
        ],
      ),
      body: ZefyrEditor(
        enabled: false,
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}
