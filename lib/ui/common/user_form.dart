import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/common/radio_item.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:flutter/material.dart';

enum UserFormType {
  register,
  profile,
}

class UserForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String gender;
  final Function(String gender) onGenderChanged;
  final UserFormType type;
  final GlobalObjectKey<FormState> key;

  UserForm.register({
    @required this.nameController,
    @required this.emailController,
    @required this.passwordController,
    @required this.gender,
    @required this.onGenderChanged,
    this.key,
    this.type = UserFormType.register,
  });

  UserForm.profile({
    @required this.nameController,
    @required this.emailController,
    @required this.passwordController,
    @required this.gender,
    @required this.onGenderChanged,
    @required this.key,
    this.type = UserFormType.profile,
  });

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  Widget _buildGenderField() {
    final label = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text('เพศ', style: TextStyle(color: Colors.black54, fontSize: 12.0)),
    );

    final radios = Row(
      children: <Widget>[
        RadioItem(
          value: 'ชาย',
          groupValue: widget.gender,
          onChanged: (String value) {
            widget.onGenderChanged(value);
          },
        ),
        RadioItem(
          value: 'หญิง',
          groupValue: widget.gender,
          onChanged: (String value) {
            widget.onGenderChanged(value);
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

    return Form(
      //  key: widget.key,
      child: Column(
        children: <Widget>[
          TextFormField(
            style: textInputStyle,
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            validator: (String value) => value.isEmpty ? 'กรุณากรอกชื่อ' : null,
            decoration: inputStyle.copyWith(labelText: 'ชื่อ - นามสกุล'),
          ),
          SizedBox(height: Dimension.fieldVerticalMargin),
          widget.type == UserFormType.register
              ? TextFormField(
                  style: textInputStyle,
                  controller: widget.emailController,
                  validator: (String value) {
                    if (value.isEmpty) return 'กรุณากรอกอีเมลล์';
                    if (!isEmail(value)) return 'รูปแบบอีเมลล์ไม่ถูกต้อง';
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputStyle.copyWith(labelText: 'อีเมลล์'),
                )
              : Container(),
          widget.type == UserFormType.register ? SizedBox(height: Dimension.fieldVerticalMargin) : Container(),
          widget.type == UserFormType.register
              ? TextFormField(
                  validator: (String value) => value.isEmpty ? 'กรุณากรอกรหัสผ่าน' : null,
                  style: textInputStyle,
                  controller: widget.passwordController,
                  keyboardType: TextInputType.text,
                  decoration: inputStyle.copyWith(labelText: 'รหัสผ่าน'),
                  obscureText: true,
                )
              : Container(),
          widget.type == UserFormType.register ? SizedBox(height: Dimension.fieldVerticalMargin) : Container(),
          _buildGenderField(),
        ],
      ),
    );
  }
}
