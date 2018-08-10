import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/redux/app/app_state.dart';
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

  ProfileScreenViewModel({
    @required this.user,
  });

  static ProfileScreenViewModel fromStore(Store<AppState> store) {
    return ProfileScreenViewModel(
      user: store.state.user,
    );
  }
}
