import 'dart:async';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/login/login_screen.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: LoginScreenViewModel.fromStore,
      builder: (BuildContext context, LoginScreenViewModel viewModel) {
        return LoginScreen(
          viewModel: viewModel,
          onLogin: viewModel.onLogin,
        );
      },
    );
  }
}

class LoginScreenViewModel {
  final LoginScreenState state;
  final Function(String, String, BuildContext) onLogin;

  LoginScreenViewModel({
    @required this.state,
    @required this.onLogin,
  });

  static void _showToast(String message, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message, style: AppStyle.snackBarMessage), duration: Duration(seconds: 4)));
  }

  static LoginScreenViewModel fromStore(Store<AppState> store) {
    return LoginScreenViewModel(
        state: store.state.loginScreenState,
        onLogin: (String email, String password, BuildContext context) {
          Completer<Null> completer = Completer();
          completer.future.catchError((error) {
            switch (error.runtimeType) {
              case UnauthorizedException:
                showToast('เข้าสู่ระบบล้มเหลว อีเมลล์หรือรหัสผ่านไม่ถูกต้อง');
                break;
              case FormatException:
                showToast('เกิดข้อผิดพลาด');
                break;
            }
          });

          store.dispatch(Login(email, password, completer, context));
        });
  }
}
