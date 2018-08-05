import 'dart:async';

import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/login/login_screen.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
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

  static LoginScreenViewModel fromStore(Store<AppState> store) {
    return LoginScreenViewModel(
        state: store.state.loginScreenState,
        onLogin: (String email, String password, BuildContext context) {
          Completer<String> completer = Completer();
          completer.future.then((String message) {
            Navigator.of(context).pushReplacementNamed(MenuScreen.route);
          }).catchError((error) {
            print(error);
          });

          store.dispatch(Login(email, password, completer));
        });
  }
}
