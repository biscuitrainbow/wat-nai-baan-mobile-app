import 'package:buddish_project/.env.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/notification/notification_action.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MenuContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      onInit: (Store store) => store.dispatch(SubscribeTopic(Environment.notificationTopicNews, context)),
      converter: MenuScreenViewModel.fromStore,
      builder: (BuildContext context, MenuScreenViewModel viewModel) {
        return MenuScreen();
      },
    );
  }
}

class MenuScreenViewModel {
  static MenuScreenViewModel fromStore(Store<AppState> store) {
    return MenuScreenViewModel();
  }
}
