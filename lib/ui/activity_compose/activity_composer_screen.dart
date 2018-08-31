import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/ui/activity_compose/activity_composer_container.dart';
import 'package:buddish_project/ui/common/button.dart';
import 'package:buddish_project/ui/common/filter_bar.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityComposeScreen extends StatefulWidget {
  static final String route = '/activityCompose';

  final ActivityComposerViewModel viewModel;

  const ActivityComposeScreen({
    this.viewModel,
  });

  @override
  _ActivityComposeScreenState createState() => _ActivityComposeScreenState();
}

class _ActivityComposeScreenState extends State<ActivityComposeScreen> {
  final formatter = DateFormat(AppString.dateTextField, 'th_TH');

  TextEditingController _titleController;
  TextEditingController _datetimeController;

  FocusNode _titleFocusNode;
  FocusNode _datetimeFocusNode;

  DateTime _datetime = DateTime.now();

  List<String> tags = [];

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _datetimeController = TextEditingController();
    _datetimeController.text = formatter.format(_datetime);

    _titleFocusNode = FocusNode();
    _datetimeFocusNode = FocusNode();

    _datetimeFocusNode.addListener(() async {
      if (_datetimeFocusNode.hasFocus) {
        _onDatetimeFocused();
      }

      _datetimeFocusNode.unfocus();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _datetimeController.dispose();

    _titleFocusNode.dispose();
    _datetimeFocusNode.dispose();
  }

  void _onSave(BuildContext context) {
    final activity = Activity(
      title: _titleController.text,
      datetime: _datetime,
      point: 5,
      tags: tags,
    );

    widget.viewModel.onSave(activity, context);
  }

  void _onDatetimeFocused() async {
    try {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime(2101),
        locale: Locale('th', 'TH'),
      );

      if (pickedDate != null) {
        final datetime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );

        setState(() {
          _datetime = datetime;
        });

        _datetimeController.text = formatter.format(datetime);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textInputStyle = TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16.0, fontFamily: 'Kanit');

    final inputStyle = InputDecoration(
      border: InputBorder.none,
      labelStyle: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      fillColor: Colors.grey.shade200,
      filled: true,
    );

    return Scaffold(
      appBar: buildAppBar(title: 'สร้างกิจกรรม'),
      body: Builder(
        builder: (BuildContext scaffoldContext) {
          return LoadingView(
            //loadingStatus: widget.viewModel.profileScreenState.loadingStatus,
            loadingStatus: LoadingStatus.initial,
            loadingContent: LoadingContent(text: 'กำลังบันทึก'),
            initialContent: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.screenVerticalPadding),
              child: Column(
                children: <Widget>[
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          style: textInputStyle,
                          focusNode: _titleFocusNode,
                          controller: _titleController,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_datetimeFocusNode),
                          decoration: inputStyle.copyWith(labelText: 'คำอธิบาย'),
                          maxLines: null,
                        ),
                        SizedBox(height: Dimension.fieldVerticalMargin),
                        TextFormField(
                          style: textInputStyle,
                          focusNode: _datetimeFocusNode,
                          controller: _datetimeController,
                          keyboardType: TextInputType.number,
                          decoration: inputStyle.copyWith(labelText: 'วันที่'),
                        ),
                        SizedBox(height: Dimension.fieldVerticalMargin),
                        Text('ประเภท', style: TextStyle(color: Colors.black54, fontSize: 12.0)),
                        FilterBar(
                          items: Activity.tag,
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          activeTextColor: Colors.white,
                          activeBackgroundColor: AppColors.primary,
                          warped: true,
                          onChanged: (selected) {
                            setState(() => tags = selected);
                          },
                        ),
                        SizedBox(height: Dimension.fieldVerticalMargin),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimension.fieldVerticalMargin * 2),
                  Button(
                    title: 'บันทึก',
                    titleColor: AppColors.primary,
                    backgroundColor: Colors.yellow,
                    onPressed: () => _onSave(context),
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
