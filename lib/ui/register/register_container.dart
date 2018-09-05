import 'dart:async';

import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/common/loading_dialog.dart';
import 'package:buddish_project/ui/register/register_screen.dart';
import 'package:buddish_project/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RegisterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: RegisterScreenViewModel.fromStore,
      builder: (BuildContext context, RegisterScreenViewModel viewModel) {
        return RegisterScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}

class RegisterScreenViewModel {
  final User user;
  final ProfileScreenState profileScreenState;
  final Function(User user, BuildContext context) onRegister;

  RegisterScreenViewModel({
    @required this.user,
    @required this.profileScreenState,
    @required this.onRegister,
  });

  static RegisterScreenViewModel fromStore(Store<AppState> store) {
    return RegisterScreenViewModel(
      user: store.state.user,
      profileScreenState: store.state.profileScreenState,
      onRegister: (User user, BuildContext scaffoldContext) {
        showDialog(context: scaffoldContext, builder: (BuildContext context) => LoadingDialog(title: 'กำลังสมัครสมาชิก'));

        Completer<Null> completer = Completer();
        completer.future.then((_) {
          showToast('สมัครสมาชิกสำเร็จ');
          Navigator.of(scaffoldContext).pop(); // Loading Dialog pop
          Navigator.of(scaffoldContext).pop(); // Register screen pop
        }).catchError((error) {
          Navigator.of(scaffoldContext).pop(); // Loading Dialog pop
          showToast('สมัครสมาชิกไม่สำเร็จ');
        });

        store.dispatch(Register(user, completer));
      },
    );
  }
}
