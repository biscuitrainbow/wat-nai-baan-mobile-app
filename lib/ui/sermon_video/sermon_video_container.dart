import 'dart:async';

import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/data/model/sermon_category.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_action.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_state.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:buddish_project/redux/video/video_action.dart';
import 'package:buddish_project/ui/login/login_screen.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SermonVideoContainer extends StatelessWidget {
  final SermonCategory category;

  const SermonVideoContainer({this.category});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: SermonVideoViewModel.fromStore,
      onInit: (Store<AppState> store) {
        Completer<Null> completer = Completer();

        store.dispatch(FetchSermonPlaylist(category.playlistId, completer));
      },
      onDispose: (Store<AppState> store) {
        store.dispatch(ResetState());
      },
      builder: (BuildContext context, SermonVideoViewModel viewModel) {
        return SermonVideoScreen(
          viewModel: viewModel,
          title: category.title,
        );
      },
    );
  }
}

class SermonVideoViewModel {
  final SermonVideoScreenState state;

  SermonVideoViewModel({
    @required this.state,
  });

  static SermonVideoViewModel fromStore(Store<AppState> store) {
    return SermonVideoViewModel(state: store.state.sermonVideoScreenState);
  }
}
