import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_state.dart';

class AppState {
  final User user;
  final LoginScreenState loginScreenState;
  final SermonVideoScreenState sermonVideoScreenState;

  AppState({
    this.user,
    this.loginScreenState,
    this.sermonVideoScreenState,
  });

  factory AppState.initial() {
    return AppState(
      user: null,
      loginScreenState: LoginScreenState.initial(),
      sermonVideoScreenState: SermonVideoScreenState.initial(),
    );
  }

  AppState copyWith({
    User user,
    LoginScreenState loginScreenState,
    SermonVideoScreenState sermonVideoScreenState,
  }) {
    return AppState(
      user: user ?? this.user,
      loginScreenState: loginScreenState ?? this.loginScreenState,
      sermonVideoScreenState: sermonVideoScreenState ?? this.sermonVideoScreenState,
    );
  }
}
