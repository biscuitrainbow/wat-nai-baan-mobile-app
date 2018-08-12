import 'dart:async';

import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: ProfileScreenViewModel.fromStore,
      builder: (BuildContext context, ProfileScreenViewModel viewModel) {
        return ProfileScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}

class ProfileScreenViewModel {
  final User user;
  final ProfileScreenState profileScreenState;
  final Function(User user, BuildContext context) onUpdate;

  ProfileScreenViewModel({
    @required this.user,
    @required this.profileScreenState,
    @required this.onUpdate,
  });

  static ProfileScreenViewModel fromStore(Store<AppState> store) {
    return ProfileScreenViewModel(
      user: store.state.user,
      profileScreenState: store.state.profileScreenState,
      onUpdate: (User user, BuildContext scaffoldContext) {
        Completer<Null> completer = Completer();
        completer.future.then((_) {
          Scaffold.of(scaffoldContext).showSnackBar(SnackBar(content: Text("บันทึกสำเร็จ"), duration: Duration(seconds: 3)));
          print("hello");
        }).catchError((error) {
          print(error);
        });

        store.dispatch(UpdateUser(user, completer));
      },
    );
  }
}
