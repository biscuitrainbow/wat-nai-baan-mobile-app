import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/ui/common/button.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/common/user_form.dart';
import 'package:buddish_project/ui/login/login_screen.dart';
import 'package:buddish_project/ui/register/register_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  static final String route = "/register";

  final RegisterScreenViewModel viewModel;

  RegisterScreen({this.viewModel});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 // GlobalObjectKey<FormState> _formKey = GlobalObjectKey<FormState>('__register_form');

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  final DateFormat formatter = DateFormat(AppString.dateOfBirthFormat, 'th');
  String gender = 'ชาย';

  void _register(BuildContext scaffoldContext) {
//    if (!_registerFormKey.currentState.validate()) {
//      return;
//    }

    final user = User(
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
      gender: gender,
    );

    widget.viewModel.onRegister(user, scaffoldContext);
  }

  void _showLogin() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.route);
  }

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: _showLogin),
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
            initialContent: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.screenVerticalPadding),
                child: Column(
                  children: <Widget>[
                    UserForm.register(
                 //     key: _formKey,
                      nameController: nameController,
                      passwordController: passwordController,
                      emailController: emailController,
                      gender: gender,
                      onGenderChanged: (String value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    SizedBox(height: Dimension.fieldVerticalMargin * 2),
                    Button(
                      title: 'บันทึก',
                      titleColor: AppColors.primary,
                      backgroundColor: Colors.yellow,
                      onPressed: () => _register(scaffoldContext),
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
