import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/ui/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: MainScreenViewModel.fromStore,
      builder: (BuildContext context, MainScreenViewModel viewModel) {
        return MainScreen(
          viewModel: viewModel,
        );
      },
    );
  }
}

class MainScreenViewModel {
  final User user;
  final String token;

  MainScreenViewModel({
    @required this.user,
    @required this.token,
  });

  static MainScreenViewModel fromStore(Store<AppState> store) {
    return MainScreenViewModel(
      user: store.state.user,
      token: store.state.token,
    );
  }
}
