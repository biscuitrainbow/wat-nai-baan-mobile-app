import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/common/button.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/login/login_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String route = '/login';

  final LoginScreenViewModel viewModel;
  final Function(String, String, BuildContext) onLogin;

  const LoginScreen({
    @required this.viewModel,
    @required this.onLogin,
  });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(text: 'user@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: 'password');

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _login() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    widget.onLogin(_emailController.text, _passwordController.text, context);
  }

  Widget _buildInitialContent() {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: Image.asset(Asset.imageLoginBg, fit: BoxFit.cover)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: _buildTextField(),
              ),
              Button(
                title: 'เข้าสู่ระบบ',
                titleColor: AppColors.main,
                backgroundColor: Colors.yellow,
                onPressed: _login,
              ),
              SizedBox(height: Dimension.fieldVerticalMargin * 5),
              Button(
                title: 'เข้าสู่ระบบด้วย Facebook',
                titleColor: Colors.white,
                backgroundColor: AppColors.facebook,
                onPressed: () => print('login'),
              ),
              SizedBox(height: Dimension.fieldVerticalMargin),
              Button(
                title: 'ลงทะเบียน',
                titleColor: AppColors.main,
                backgroundColor: Colors.white,
                onPressed: () => print('login'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 164.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          focusNode: _emailFocusNode,
          onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_passwordFocusNode),
          validator: (String value) => value.isEmpty ? 'กรุณากรอกอีเมลล์' : null,
          decoration: InputDecoration(
            hintText: 'อีเมลล์',
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        SizedBox(height: Dimension.fieldVerticalMargin),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          onFieldSubmitted: (String value) => _login(),
          validator: (String value) => value.isEmpty ? 'กรุณากรอกรหัสผ่าน' : null,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'รหัสผ่าน',
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        SizedBox(height: Dimension.fieldVerticalMargin),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: LoadingView(
          loadingStatus: widget.viewModel.state.loadingStatus,
          initialContent: _buildInitialContent(),
          loadingContent: LoadingContent(text: 'กำลังเข้าสู่ระบบ'),
        ));
  }
}
