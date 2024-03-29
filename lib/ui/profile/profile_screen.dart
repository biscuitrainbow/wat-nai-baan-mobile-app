import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/common/button.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/common/radio_item.dart';
import 'package:buddish_project/ui/profile/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  static final String route = "/profile";

  final ProfileScreenViewModel viewModel;

  const ProfileScreen({this.viewModel});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final MaskedTextController telController = MaskedTextController(mask: '000-0000000');
  final MaskedTextController dateOfBirthController = MaskedTextController(mask: '00-00-0000');

  final DateFormat formatter = DateFormat(AppString.dateOfBirthFormat, 'th');

  String gender = 'ชาย';

  Widget _buildGenderField() {
    final label = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text('เพศ', style: TextStyle(color: Colors.black54, fontSize: 12.0)),
    );

    final radios = Row(
      children: <Widget>[
        RadioItem(
          value: 'ชาย',
          groupValue: gender,
          onChanged: (String value) {
            setState(() => gender = value);
          },
        ),
        RadioItem(
          value: 'หญิง',
          groupValue: gender,
          onChanged: (String value) {
            setState(() => gender = value);
          },
        ),
        RadioItem(
          value: 'ไม่ระบุ',
          groupValue: gender,
          onChanged: (String value) {
            setState(() => gender = value);
          },
        )
      ],
    );

    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label,
          radios,
        ],
      ),
    );
  }

  void _update(BuildContext scaffoldContext) {
    final user = widget.viewModel.user.copyWith(
      name: nameController.text,
      tel: telController.text.isNotEmpty ? telController.text.replaceAll(RegExp(r'-'), '') : null,
      dateOfBirth: dateOfBirthController.text.isNotEmpty ? formatter.parse(dateOfBirthController.text) : null,
      gender: gender,
    );

    widget.viewModel.onUpdate(user, scaffoldContext);
  }

  @override
  void initState() {
    final user = widget.viewModel.user;

    nameController.text = user.name;
    telController.text = user.tel;
    dateOfBirthController.text = user.dateOfBirth != null ? formatter.format(user.dateOfBirth) : '';
    gender = user.gender;

    super.initState();
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        elevation: 1.0,
        title: Text('ข้อมูลส่วนตัว', style: AppStyle.appbarTitle),
      ),
      resizeToAvoidBottomPadding: true,
      body: Builder(
        builder: (BuildContext scaffoldContext) {
          return LoadingView(
            loadingStatus: widget.viewModel.profileScreenState.loadingStatus,
            loadingContent: LoadingContent(text: 'กำลังบันทึก'),
            initialContent: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.screenVerticalPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: textInputStyle,
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: inputStyle.copyWith(labelText: 'ชื่อ - นามสกุล'),
                          ),
                          SizedBox(height: Dimension.fieldVerticalMargin),
                          TextFormField(
                            style: textInputStyle,
                            controller: telController,
                            keyboardType: TextInputType.number,
                            decoration: inputStyle.copyWith(labelText: 'เบอร์โทร'),
                          ),
                          SizedBox(height: Dimension.fieldVerticalMargin),
                          TextFormField(
                            style: textInputStyle,
                            controller: dateOfBirthController,
                            keyboardType: TextInputType.number,
                            decoration: inputStyle.copyWith(labelText: 'วันเกิด', helperText: 'เช่น 30-12-1994'),
                          ),
                          SizedBox(height: Dimension.fieldVerticalMargin),
                          _buildGenderField(),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimension.fieldVerticalMargin * 2),
                    Button(
                      title: 'บันทึก',
                      titleColor: AppColors.primary,
                      backgroundColor: Colors.yellow,
                      onPressed: () => _update(scaffoldContext),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
